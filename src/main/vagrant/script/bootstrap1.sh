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
apt-get -qq -y install git htop tmux

echo
echo "[status] add new GPG key"
echo

# add new gpg key
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo
echo "[status] update APT package source list"
echo

echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

echo
echo "[status] Updating APT package info"
echo

# Update the APT package index
apt-get -qq update > /dev/null 2>&1

echo
echo "[status] purge old docker repo (if exists)"
echo

# purge old repo
apt-get purge lxc-docker*

echo
echo "[status] Verify apt is pulling from the right repository."
echo

# Verify apt is pulling from the right repository.
apt-cache policy docker-engine

echo
echo "[status] Updating APT package info"
echo

# Update the APT package index
apt-get -qq update > /dev/null 2>&1

echo
echo "[status] Install Linux trusty image extra"
echo

# install linux trusty image extra
apt-get install linux-image-extra-`uname -r` -y

echo
echo "[status] Updating APT package info"
echo

# Update the APT package index
apt-get -qq update > /dev/null 2>&1

echo
echo "[status] Install both required and optional Linux packages"
echo

#Install both required and optional packages.
apt-get -y install linux-image-generic-lts-trusty

echo
echo "[status] will attempt VM reboot now..."
echo

# END
#========