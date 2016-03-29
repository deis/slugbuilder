FROM heroku/cedar:14

RUN mkdir /app
RUN addgroup --quiet --gid 2000 slug && \
  useradd slug --uid=2000 --gid=2000 --home-dir /app --no-create-home

RUN apt-get update && apt-get install -y ca-certificates curl python libffi-dev
RUN curl -sSL https://raw.githubusercontent.com/pypa/pip/7.1.2/contrib/get-pip.py | python -
RUN pip install boto3==1.2.6
RUN pip install  gcloud==0.11.0
RUN pip install azure-storage==0.30.0

ADD ./bin /bin
RUN chown -R slug:slug /app
RUN chown slug:slug /bin/get_object
RUN chown slug:slug /bin/put_object

USER slug
ENV HOME /app
ADD ./builder/ /tmp/builder
RUN /tmp/builder/install-buildpacks

ENTRYPOINT ["/tmp/builder/build.sh"]

ENV DEIS_RELEASE 2.0.0-dev
