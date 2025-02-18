ARG BASE_IMAGE=docker.io/haproxy:2.9-alpine3.20
FROM ${BASE_IMAGE}
USER root
# adding haproxy user to root group just to accommodate for compose-spec not allowing setting owner/mode on mounts,
# and default mode of socket

RUN sed -i 's/^root:.*/\0,haproxy/' /etc/group

USER haproxy

EXPOSE 2375
ENV ALLOW_RESTARTS=0 \
    ALLOW_STOP=0 \
    ALLOW_START=0 \
    AUTH=0 \
    BUILD=0 \
    COMMIT=0 \
    CONFIGS=0 \
    CONTAINERS=0 \
    DISTRIBUTION=0 \
    EVENTS=1 \
    EXEC=0 \
    GRPC=0 \
    IMAGES=0 \
    INFO=0 \
    LOG_LEVEL=info \
    NETWORKS=0 \
    NODES=0 \
    PING=1 \
    PLUGINS=0 \
    POST=0 \
    SECRETS=0 \
    SERVICES=0 \
    SESSION=0 \
    SOCKET_PATH=/var/run/docker.sock \
    SWARM=0 \
    SYSTEM=0 \
    TASKS=0 \
    VERSION=1 \
    VOLUMES=0
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
