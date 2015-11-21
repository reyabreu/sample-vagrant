#!/usr/bin/env bash

#========
# START

echo "[start] Continue bootstrap"

# The default VM has an annoying APT lock file

echo
echo "[status] Removing stale APT lock file"
echo

if [ -f /var/lib/apt/lists/lock ]; then
  rm /var/lib/apt/lists/lock
fi

## OS UPDATE & TOOLS ##

echo
echo "[status] Updating APT package info and installing tools"
echo

# Update the APT package index
apt-get -qq update > /dev/null 2>&1

echo
echo "[status] Install Docker"
echo

# Install Docker
apt-get -y install docker-engine

echo
echo "[status] Install curl"
echo

# Install curl
apt-get -qq -y install curl

echo
echo "[status] Create docker group and add current user"
echo

groupadd docker
gpasswd -a ${USER} docker
service docker restart

echo
echo "[fin] Bootstrap done."
echo

# END
#========