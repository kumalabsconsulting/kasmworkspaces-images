#!/usr/bin/env bash
set -ex

## K9S Install
echo "

############# INSTALLING K9S ######################

"
curl -L https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz -o /root/k9s_Linux_amd64.tar.gz
tar -xzvf /root/k9s_Linux_amd64.tar.gz k9s && cp k9s /usr/local/bin/
chmod +x /usr/local/bin/k9s
rm -rf /root/k9s*


## Fix ownership
chown -R 1000:0 /home/kasm-user

