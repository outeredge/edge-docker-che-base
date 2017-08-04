FROM eclipse/stack-base:ubuntu

ENV DOCKER_VERSION 17.03.1
ENV DEBIAN_FRONTEND noninteractive

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo bash - && \
    sudo apt-get install -y --no-install-recommends make nano netcat nodejs jq mysql-client && \
    wget -qO- https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz | sudo tar zxf - --strip=1 -C /usr/local/bin/ && \
    wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sudo sh

CMD DOCKER_GID=$(stat -c '%g' /var/run/docker.sock) && \
    sudo groupadd -for -g ${DOCKER_GID} docker && \
    sudo usermod -aG docker user && \
    tail -f /dev/null
