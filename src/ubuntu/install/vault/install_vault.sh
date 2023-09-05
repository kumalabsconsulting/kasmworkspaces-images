#!/usr/bin/env bash
set -ex


## VAULT INSTALL
echo "

############# INSTALLING VAULT ######################

"

apt-get update && apt-get install -y gpg
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get install -y vault


## Fix ownership
chown -R 1000:0 /home/kasm-user