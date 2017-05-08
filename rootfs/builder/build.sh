#!/usr/bin/env bash
set -eo pipefail

function sleep_before_exit {
	# delay before exiting, so stdout/stderr flushes through the logging system
	sleep 3
}
trap sleep_before_exit EXIT

[[ $DEIS_DEBUG ]] && set -x
unset DEIS_DEBUG

app_dir=/app
build_root=/tmp/build
cache_root=/tmp/cache
cache_file=/tmp/cache.tgz
secret_dir=/tmp/env
env_root=/tmp/environment
buildpack_root=/tmp/buildpacks

mkdir -p $app_dir
mkdir -p $cache_root
mkdir -p $env_root
mkdir -p $secret_dir
mkdir -p $buildpack_root
mkdir -p $build_root/.profile.d

if ! [[ -z "${TAR_PATH}" ]]; then
	get_object
	tar -xzf /tmp/slug.tgz -C /app/
	unset TAR_PATH
fi

if [[ "$1" == "-" ]]; then
    slug_file="$1"
else
    slug_file=/tmp/slug.tgz
fi

function output_redirect() {
    if [[ "$slug_file" == "-" ]]; then
        cat - 1>&2
    else
        cat -
    fi
}

function echo_title() {
    echo $'\e[1G----->' "$*" | output_redirect
}

function echo_normal() {
    echo $'\e[1G      ' "$*" | output_redirect
}

function ensure_indent() {
    while read -r line; do
        if [[ "$line" == --* ]]; then
            echo $'\e[1G'"$line" | output_redirect
        else
            echo $'\e[1G      ' "$line" | output_redirect
        fi
    done
}

function cache_fingerprint() {
  md5deep -r ${cache_root} | sort | uniq | md5sum
}

# Restore cache when a $CACHE_PATH was supplied
if ! [[ -z "${CACHE_PATH}" ]]; then
  echo_title "Restoring cache..."
  restore_cache
  if [[ -f ${cache_file} ]]; then
    tar -xzf ${cache_file} -C ${cache_root}
    echo_normal "Done!"
  else
    echo_normal "No cache file found. If this is the first deploy, it will be created now."
  fi

  original_cache_fingerprint=$(cache_fingerprint)
fi

## Copy application code over
if [ -d "/tmp/app" ]; then
    cp -rf /tmp/app/. $app_dir
    chown -R slug:slug $app_dir
fi

# In heroku, there are two separate directories, and some
# buildpacks expect that.
cp -r $app_dir/. $build_root

## Buildpack fixes

export APP_DIR="$app_dir"
export HOME="$app_dir"
REQUEST_ID=$(openssl rand -base64 32)
export REQUEST_ID
export STACK=heroku-16

## copy the environment dir excluding the ephemeral ..data/ dir and other symlinks created by Kubernetes.

if [ "$(ls -A $secret_dir)" ]; then
   cp $secret_dir/* $env_root/
fi

## SSH key configuration

if [[ -f "$env_root/SSH_KEY" ]]; then
    mkdir -p ~/.ssh/
    chmod 700 ~/.ssh/

    base64 -d "$env_root/SSH_KEY" > ~/.ssh/id_rsa
    chmod 400 ~/.ssh/id_rsa

    echo 'StrictHostKeyChecking=no' > ~/.ssh/config
    chmod 600 ~/.ssh/config
fi

## Buildpack detection

buildpacks=($buildpack_root/*)
selected_buildpack=

if [[ -n "$BUILDPACK_URL" ]]; then
    echo_title "Fetching custom buildpack"

    buildpack="$buildpack_root/custom"
    rm -fr "$buildpack"

    url=${BUILDPACK_URL%#*}
    committish=${BUILDPACK_URL#*#}

    if [ "$committish" == "$url" ]; then
        committish="master"
    fi

    set +e
    git clone --branch "$committish" --depth=1 "$url" "$buildpack" &> /dev/null
    SHALLOW_CLONED=$?
    set -e
    if [ $SHALLOW_CLONED -ne 0 ]; then
        # if the shallow clone failed partway through, clean up and try a full clone
        rm -rf "$buildpack"
        git clone --quiet "$url" "$buildpack"
        pushd "$buildpack" &>/dev/null
            git checkout --quiet "$committish"
            git submodule init --quiet
            git submodule update --quiet --recursive
        popd &>/dev/null
    fi

    selected_buildpack="$buildpack"
    buildpack_name=$($buildpack/bin/detect "$build_root") && selected_buildpack=$buildpack
else
    for buildpack in "${buildpacks[@]}"; do
        buildpack_name=$("$buildpack/bin/detect" "$build_root") && selected_buildpack=$buildpack && break
    done
fi

if [[ -n "$selected_buildpack" ]]; then
    echo_title "$buildpack_name app detected"
else
    echo_title "Unable to select a buildpack"
    exit 1
fi

## Run pre-compile hook

if [[ -f "$build_root/bin/pre-compile" ]]; then
    pushd "$build_root" &> /dev/null
    "$build_root/bin/pre-compile"
    popd &>/dev/null
fi

## Buildpack compile

"$selected_buildpack/bin/compile" "$build_root" "$cache_root" "$env_root" | ensure_indent

"$selected_buildpack/bin/release" "$build_root" > $build_root/.release

## Run post-compile hook

if [[ -f "$build_root/bin/post-compile" ]]; then
    pushd "$build_root" &> /dev/null
    "$build_root/bin/post-compile"
    popd &>/dev/null
fi

## Display process types

echo_title "Discovering process types"
if [[ -f "$build_root/Procfile" ]]; then
    types=$(read_procfile_keys "$build_root/Procfile")
    echo_normal "Procfile declares types -> $types"
fi
default_types=""
if [[ -s "$build_root/.release" ]]; then
    default_types=$(ruby -e "require 'yaml';puts ((YAML.load_file('$build_root/.release') || {})['default_process_types'] || {}).keys().join(', ')")
    [[ $default_types ]] && echo_normal "Default process types for $buildpack_name -> $default_types"
fi

# Fix any wayward permissions. We want everything in app to be owned
# by slug.
chown -R slug:slug $build_root/*


## Produce slug

if [[ -f "$build_root/.slugignore" ]]; then
    tar -z --exclude='.git' -X "$build_root/.slugignore" -C $build_root -cf $slug_file . | cat
else
    tar -z --exclude='.git' -C $build_root -cf $slug_file . | cat
fi

if [[ ! -f "$build_root/Procfile" ]]; then
	if [[ -s "$build_root/.release" ]] && [[ $default_types ]]; then
		ruby -e "require 'yaml';procTypes = (YAML.load_file('$build_root/.release')['default_process_types']);open('$build_root/Procfile','w') {|f| YAML.dump(procTypes,f)}"
	else
		echo "{}" > $build_root/Procfile
	fi
fi

# Compress and save cache
if ! [[ -z "${CACHE_PATH}" ]]; then
  echo_title "Checking for changes inside the cache directory..."
  # If there's any files in the cache_root folder, we'll create a tar and upload
  # it for future use
  if [ "$(ls -A ${cache_root})" ]; then
    # Let's check if the fingerprint changed, if it did, we'll be updating
    # the cache
    if [[ "$original_cache_fingerprint" != "$(cache_fingerprint)" ]]; then
      echo_normal "Files inside cache folder changed, uploading new cache..."

      # Create a new cache file and check if it requires to be updated
      tar -z -C ${cache_root} -cf ${cache_file} .
      cache_size=$(du -Sh "$cache_file" | cut -f1)

      store_cache
      echo_normal "Done: Uploaded cache (${cache_size})"
    else
      echo_normal "Cache unchanged, not updating"
    fi
  else
    echo_normal "No files were added to the cache folder, cache wasn't updated"
  fi
fi

if [[ "$slug_file" != "-" ]]; then
    slug_size=$(du -Sh "$slug_file" | cut -f1)
    echo_title "Compiled slug size is $slug_size"

    if [[ $PUT_PATH ]]; then
			put_object
		fi
fi
