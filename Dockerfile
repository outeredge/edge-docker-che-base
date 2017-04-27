FROM docker:1.11.2

RUN apk --no-cache add tar bash bash-completion unzip git make && \    
    wget -qO- https://raw.githubusercontent.com/outeredge/dredger/master/install.sh | sh

WORKDIR /projects

CMD export DREDGER_MOUNT=$(docker inspect --format '{{ range .Mounts }}{{ if eq .Destination "'"$CHE_PROJECTS_ROOT"'" }}{{ .Source }}{{ end }}{{ end }}' $HOSTNAME) && tail -f /dev/null
