#!/bin/bash -e

DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)

sudo groupadd -for -g ${DOCKER_GID} docker
sudo usermod -aG docker user
sudo usermod -aG www-data user
