FROM heroku/cedar:14

RUN mkdir /app
RUN addgroup --quiet --gid 2000 slug && \
  useradd slug --uid=2000 --gid=2000 --home-dir /app --no-create-home
ADD ./bin /bin
RUN chown -R slug:slug /app
RUN chown slug:slug /bin/mc
USER slug
ENV HOME /app
ADD ./builder/ /tmp/builder
RUN /tmp/builder/install-buildpacks
ENTRYPOINT ["/tmp/builder/build.sh"]

ENV DEIS_RELEASE 1.12.0-dev
