#!/usr/bin/env bash
set -ex

## COMMITIZEN INSTALL
echo "

############# INSTALLING COMMITIZEN ######################

"
pip install --user -U Commitizen==2.42.1


## Fix ownership
chown -R 1000:0 /home/kasm-user

