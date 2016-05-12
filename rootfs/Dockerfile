FROM heroku/cedar:14

RUN mkdir /app
RUN addgroup --quiet --gid 2000 slug && \
  useradd slug --uid=2000 --gid=2000 --home-dir /app --no-create-home

ADD ./bin /bin
ADD https://dl.bintray.com/deis/deisci/objstorage-90ca1f4-linux-amd64 /bin/objstorage
RUN chmod +x /bin/objstorage
RUN chown -R slug:slug /app
RUN chown slug:slug /bin/get_object
RUN chown slug:slug /bin/put_object
RUN chown slug:slug /bin/objstorage

USER slug
ENV HOME /app
ADD ./builder/ /tmp/builder
RUN /tmp/builder/install-buildpacks

ENTRYPOINT ["/tmp/builder/build.sh"]

ENV WORKFLOW_RELEASE 2.0.0-dev
