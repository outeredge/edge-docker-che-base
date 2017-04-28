FROM ubuntu:16.04

ENV DOCKER_VERSION 1.11.2

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends bash-completion unzip git make openssh-server nano curl ca-certificates wget software-properties-common apt-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz | tar zxf - --strip=1 -C /usr/local/bin/ && \
    wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sh && \
    mkdir /var/run/sshd && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

WORKDIR /projects

CMD /usr/sbin/sshd -D && sleep 2147483647
