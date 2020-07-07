FROM alpine:3.12.0

ARG OVERTURE_VER=v1.6.1
ARG OVERTURE_URL=https://github.com/shawn1m/overture/releases/download/$OVERTURE_VER/overture-linux-amd64.zip

RUN set -ex && \
    apk add --no-cache ca-certificates unzip wget && \
    mkdir -p /config && \
    mkdir -p /etc/overture && \
    cd /tmp && \
    wget $OVERTURE_URL && \
    unzip overture-linux-amd64.zip && \
    mv overture-linux-amd64 /usr/local/bin/overture && \
    rm -rf /tmp/*

COPY config/* /config/

VOLUME /etc/overture

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 53
CMD ["overture", "-c", "/etc/overture/config.json"]