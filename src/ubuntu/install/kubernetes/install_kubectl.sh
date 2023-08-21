#!/usr/bin/env bash
set -ex
# https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/
# https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md

## KUBECTL INSTALL
echo "

############# INSTALLING KUBECTL ######################

"
mkdir -p /home/kasm-user/.kube
apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null

## Fix ownership
chown -R 1000:0 /home/kasm-user

