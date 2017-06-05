FROM eclipse/stack-base:ubuntu

ENV DOCKER_VERSION 1.11.2
ENV DEBIAN_FRONTEND noninteractive

USER root

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y --no-install-recommends make nano netcat nodejs jq mysql-client && \
    wget -qO- https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar zxf - --strip=1 -C /usr/local/bin/ && \
    wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sh && \
    echo "if [ -f /etc/bash_completion ]; then\n  . /etc/bash_completion\nfi" >> /root/.bashrc
