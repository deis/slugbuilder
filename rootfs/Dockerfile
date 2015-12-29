FROM heroku/cedar:14

RUN mkdir /app
RUN addgroup --quiet --gid 2000 slug && \
  useradd slug --uid=2000 --gid=2000 --home-dir /app --no-create-home
ADD ./bin /bin
RUN chown -R slug:slug /app
RUN chown slug:slug /bin/mc

USER slug
ENV HOME /app
ENV MC_CONFIG=/app/mc_config
RUN mkdir -p /app/mc_config
RUN chmod u+rw /app/mc_config
ADD ./builder/ /tmp/builder
RUN /tmp/builder/install-buildpacks

# this is so the minio client (https://github.com/minio/mc) works properly
ENV DOCKERIMAGE=1
ENTRYPOINT ["/tmp/builder/build.sh"]

ENV DEIS_VERSION 2.0.0-dev
