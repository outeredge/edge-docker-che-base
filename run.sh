#!/bin/bash -e

export DREDGER_MOUNT=$(docker inspect --format '{{ range .Mounts }}{{ if eq .Destination "'"$CHE_PROJECTS_ROOT"'" }}{{ .Source }}{{ end }}{{ end }}' $HOSTNAME)

tail -f /dev/null
