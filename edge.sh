#!/bin/bash -e

DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)

sudo userdel -f www-data

sudo groupadd -for -g ${DOCKER_GID} docker
sudo usermod -aG docker user

#sudo usermod -g www-data user
sudo usermod -u 33 user
