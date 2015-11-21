#!/usr/bin/env bash

#========
# START

echo
echo "[status] change to /vagrant folder"
echo

cd /vagrant

echo
echo "[status] pull docker images"
echo

echo
echo "[status] pull MongoDB image"
echo

#pull MongoDB image
docker pull mongo:3.0.7

echo
echo "[status] pull JasperServer report image"
echo

#pull jasper reporst server
docker pull vtajzich/jasperreports-server:ce_latest

echo
echo "[fin] done."
echo

# END
#========