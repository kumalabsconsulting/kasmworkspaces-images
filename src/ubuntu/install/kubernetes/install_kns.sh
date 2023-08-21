#!/usr/bin/env bash
set -ex

## KNS Install
echo "

############# INSTALLING KNS ######################

"
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
apt-get install -y fzf


## Fix ownership
chown -R 1000:0 /home/kasm-user

