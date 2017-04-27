#!/bin/bash -e

echo DREDGER_MOUNT=$(docker inspect --format '{{ range .Mounts }}{{ if eq .Destination "'"$CHE_PROJECTS_ROOT"'" }}{{ .Source }}{{ end }}{{ end }}' $HOSTNAME) > /etc/environment

tail -f /dev/null
