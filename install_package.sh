#!/bin/bash

<<info

ths script will install the package that you pass in the arguments


ex.. ./install_package.sh ngix
./install_package.sh docker.io
./install_package.sh unzip
$ is a arguments
info

echo "Installing $1"

sudo apt-get update /dev/null
sudo apt-get install $1 -y /dev/null

echo "Installation complate"
