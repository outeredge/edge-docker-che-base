FROM eclipse/stack-base:ubuntu

ENV DOCKER_VERSION 17.03.1

USER root

RUN apt-get update && apt-get install -y --no-install-recommends make nano netcat jq mysql-client && \
    curl -L -o /usr/local/bin/unison-fsmonitor https://github.com/TentativeConvert/Syndicator/raw/master/unison-binaries/unison-fsmonitor && \
    chmod +x /usr/local/bin/unison-fsmonitor && \
    wget -qO- https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz | tar zxf - --strip=1 -C /usr/local/bin/

COPY edge.sh /home/user/

RUN wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | bash

USER user

CMD /home/user/edge.sh && tail -f /dev/null
