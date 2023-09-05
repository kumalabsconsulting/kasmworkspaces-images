#!/usr/bin/env bash
set -ex


## TALOS INSTALL
echo "

############# INSTALLING TALOS ######################

"
apt-get update && apt-get install -y sudo
curl -sL https://talos.dev/install | sh
apt-get remove -y sudo
## Fix ownership
chown -R 1000:0 /home/kasm-user