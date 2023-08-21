#!/usr/bin/env bash
set -ex

apt install -y sudo

## HELM INSTALL
echo "

############# INSTALLING HELM ######################

"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

apt remove -y sudo
## Fix ownership
chown -R 1000:0 /home/kasm-user

