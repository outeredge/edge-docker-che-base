FROM docker:1.11.2

RUN apk --no-cache add tar bash bash-completion unzip git make && \    
    wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sh

WORKDIR /projects

CMD ["/run.sh"]
