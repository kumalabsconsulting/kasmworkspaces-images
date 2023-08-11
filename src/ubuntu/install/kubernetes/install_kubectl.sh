#!/usr/bin/env bash
set -ex
# https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/
# https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md

OS=linux                        # Pick the right os: linux, darwin (intel only)
VERSION=0.7.0                   # Pick the current version.

## KUBECTL INSTALL
echo "

############# INSTALLING KUBECTL ######################

"
mkdir -p /home/kasm-user/.kube
apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl sudo
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null

## KNS Install
echo "

############# INSTALLING KNS ######################

"
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
curl -L https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz -o /root/k9s_Linux_amd64.tar.gz
tar -xzvf /root/k9s_Linux_amd64.tar.gz k9s && cp k9s /usr/local/bin/
chmod +x /usr/local/bin/k9s
rm -rf /root/k9s*
apt-get install -y fzf


## SWITCHER INSTALL
echo "

############# INSTALLING SWITCHER ######################

"
curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${OS}_amd64
chmod +x /usr/local/bin/switcher
curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh
chmod +x /usr/local/bin/switch.sh
#cp $INST_DIR/ubuntu/install/kubernetes/switch-config.yaml /home/kasm-user/.kube/

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

