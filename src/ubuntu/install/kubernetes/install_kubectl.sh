#!/usr/bin/env bash
set -ex
# https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/
# https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md

## KUBECTL INSTALL
echo "

############# INSTALLING KUBECTL ######################

"
mkdir -p /home/kasm-user/.kube
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null

## Fix ownership
chown -R 1000:0 /home/kasm-user

