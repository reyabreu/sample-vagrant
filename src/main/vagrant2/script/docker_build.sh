#!/usr/bin/env bash

#========
# START

echo
echo "[status] change to /vagrant folder"
echo

cd /vagrant

echo
echo "[status] Stop and remove all containers"
echo

# Stop and remove all containers
script/docker_clean.sh

echo
echo "[status] remote login to Docker HUB"
echo

# login to docker index
script/docker_login.sh

echo
echo "[status] create and run all images"
echo

#refer to docker-compose.yml
docker-compose up -d

echo
echo "[fin] done."
echo

# END
#========