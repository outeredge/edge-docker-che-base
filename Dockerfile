FROM docker:1.11.2

RUN apk --no-cache --update add tar bash bash-completion unzip git make

RUN wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sh

WORKDIR /projects

CMD tail -f /dev/null
