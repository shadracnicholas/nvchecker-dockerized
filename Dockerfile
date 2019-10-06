FROM python:3.7.4-alpine3.10

ENV TORNADO_VERSION 6.0.3
ENV PYCURL_VERSION 7.43.0.3
ENV NVCHECKER_VERSION 1.4.4

COPY docker-entrypoint.sh /

RUN apk --upgrade --no-cache add \
    bash \
  && apk --no-cache --virtual build.deps add \
    curl-dev \
    build-base \
  && pip install --no-cache-dir \
    tornado==${TORNADO_VERSION}\
    pycurl==${PYCURL_VERSION} \
    nvchecker==${NVCHECKER_VERSION} \
  && apk del build.deps \
  && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
