FROM eclipse/stack-base:ubuntu

USER root

ENV DOCKER_VERSION 1.11.2

RUN apt-get update && apt-get install -y --no-install-recommends make nano && \
    wget -qO- https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar zxf - --strip=1 -C /usr/local/bin/ && \
    wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sh
