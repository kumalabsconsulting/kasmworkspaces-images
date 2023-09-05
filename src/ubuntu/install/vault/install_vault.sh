#!/usr/bin/env bash
set -ex


## VAULT INSTALL
echo "

############# INSTALLING VAULT ######################

"

apt-get update && apt-get install -y gpg
apt-get install -y vault


## Fix ownership
chown -R 1000:0 /home/kasm-user