### 2.0.0-alpha -> v2.0.0-beta1

#### Features

 - [`b521c89`](https://github.com/deis/slugbuilder/commit/b521c89810fffd315b4f1ea53de534dfc1399535) mutable: add support for immutable builds
 - [`8d4e36f`](https://github.com/deis/slugbuilder/commit/8d4e36f2850465aa9b8d374455228e437d7b1c5e) gcs: change signature to s3v2 based on gcs domain

#### Fixes

 - [`5d58418`](https://github.com/deis/slugbuilder/commit/5d58418daec1716b77b320e03d4e528c25a579fd) ProcFile: get procfile from the slug if it is not provided
 - [`9145cfd`](https://github.com/deis/slugbuilder/commit/9145cfd91b75a9119ab0f79c8ea817a3918da0eb) deis-slugbuilder.yaml,deis-store-secret.yaml: remove secret, use minio-user instead

#### Maintenance

 - [`03f84d9`](https://github.com/deis/slugbuilder/commit/03f84d9e8debe1924c92c5feb32918c30479375d) buildpacks: update heroku-buildpack-go to v31
 - [`352c0c6`](https://github.com/deis/slugbuilder/commit/352c0c62ef7769c0e4311be5d513c59b2fcc3c62) buildpacks: update heroku-buildpack-scala to v66
 - [`ce9f98a`](https://github.com/deis/slugbuilder/commit/ce9f98a66b1bd6faed5e1f538db49c4017dfc284) buildpacks: update heroku-buildpack-php to v94
 - [`2c9d592`](https://github.com/deis/slugbuilder/commit/2c9d592bf63cdf29943719c49297e4a2e9993a09) buildpacks: update heroku-buildpack-nodejs to v88
 - [`907a71c`](https://github.com/deis/slugbuilder/commit/907a71cfd23c139e9e81da4fb4ca03e7584d631d) buildpacks: update all Heroku buildpacks
 - [`6daa794`](https://github.com/deis/slugbuilder/commit/6daa794a1b918e52689ffcf6110dab74ed23fd0f) release: bump version to v2-beta

### 2.0.0-alpha

#### Features

 - [`ebe48c2`](https://github.com/deis/slugbuilder/commit/ebe48c20442e2bb193f8e6c26868894d1522c457) deploy.sh: push deisci/slugbuilder:v2-alpha images from master

#### Fixes

 - [`16da6d4`](https://github.com/deis/slugbuilder/commit/16da6d431604c1172b376850af8841be257f336c) build.sh: remove keys from build output
 - [`39b1d10`](https://github.com/deis/slugbuilder/commit/39b1d1008ff423345a7ab1d7e627737741e8950b) build.sh: pipe all mc output to /dev/null
 - [`db9ca5f`](https://github.com/deis/slugbuilder/commit/db9ca5febc2aecf239dff11548d3817bc49427aa) Dockerfile,mc,build.sh: add mc binary and configure it for use
 - [`37e9c2c`](https://github.com/deis/slugbuilder/commit/37e9c2c896cf8606fef85066b1dffdcf68302b28) Dockerfile,mc,build.sh: add support for downloading tarballs from minio
 - [`1eaaca3`](https://github.com/deis/slugbuilder/commit/1eaaca3e20c1e88bdb2852d12a504685b4a5ab72) build: change if condition to faill over no credentials endpoint

#### Maintenance

 - [`8b1f9fd`](https://github.com/deis/slugbuilder/commit/8b1f9fd6b17322357b81f4a70b0eba6f948c7e23) release: set version and lock to deis registry
 - [`d01e9ec`](https://github.com/deis/slugbuilder/commit/d01e9ec398a5a472f676918e7cda0e1793884e31) Dockerfile: update version
