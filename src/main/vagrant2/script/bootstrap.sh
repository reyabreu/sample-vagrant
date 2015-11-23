#!/usr/bin/env bash

#========
# START

echo "[start] Proceeding with bootstrap"

# The default VM has an annoying APT lock file

echo
echo "[status] Removing stale APT lock file"
echo

if [ -f /var/lib/apt/lists/lock ]; then
  rm /var/lib/apt/lists/lock
fi

## OS UPDATE & TOOLS ##

echo
echo "[status] add vagrant user to no-password sudoers"
echo

echo 'vagrant  ALL= (ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

echo
echo "[status] Updating APT package info"
echo

# Update the APT package index
apt-get -qq update > /dev/null 2>&1

echo
echo "[status] Installing tools"
echo

# Install some base tools
apt-get -qq -y install git htop tmux curl

echo
echo "[status] Create docker group and add current user"
echo

groupadd docker
gpasswd -a ${USER} docker
gpasswd -a vagrant docker

echo
echo "[fin] Bootstrap finished succesfully."
echo

# END
#========
