#!/usr/bin/env bash
set -ex


## TALOS INSTALL
echo "

############# INSTALLING TALOS ######################

"
curl -sL https://talos.dev/install | sh

## Fix ownership
chown -R 1000:0 /home/kasm-user