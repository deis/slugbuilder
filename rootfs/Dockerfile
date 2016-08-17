FROM heroku/cedar:14

RUN mkdir /app
RUN addgroup --quiet --gid 2000 slug && \
  useradd slug --uid=2000 --gid=2000 --home-dir /app --no-create-home

# disable source repos (speeds up apt-get update)
RUN sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list && \
apt-get update && \
apt-get install -y md5deep && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc && \
bash -c "mkdir -p /usr/share/man/man{1..8}"

ADD . /
ENV PYTHONPATH $PYTHONPATH:/usr/local/lib/python3/site-packages
ADD https://storage.googleapis.com/object-storage-cli/bb8e054/objstorage-bb8e054-linux-amd64 /bin/objstorage
RUN chmod +x /bin/objstorage
RUN chown -R slug:slug /app
RUN chown slug:slug /bin/get_object
RUN chown slug:slug /bin/normalize_storage
RUN chown slug:slug /bin/put_object
RUN chown slug:slug /bin/objstorage
RUN chown slug:slug /bin/read_procfile_keys
RUN chown slug:slug /bin/restore_cache
RUN chown slug:slug /bin/store_cache

USER slug
ENV HOME /app
RUN /builder/install-buildpacks

ENTRYPOINT ["/builder/build.sh"]
