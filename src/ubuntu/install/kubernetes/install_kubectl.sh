#!/usr/bin/env bash
set -ex
# https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/
# https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md

OS=linux                        # Pick the right os: linux, darwin (intel only)
VERSION=0.7.0                   # Pick the current version.

mkdir -p /home/kasm-user/.kube
apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
curl -L https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz -o /root/k9s_Linux_amd64.tar.gz
tar -xzvf /root/k9s_Linux_amd64.tar.gz k9s && cp k9s /usr/local/bin/
chmod +x /usr/local/bin/k9s
rm -rf /root/k9s*
apt-get update
apt-get install -y kubectl fzf
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null
curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${OS}_amd64
chmod +x /usr/local/bin/switcher
curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh
chmod +x /usr/local/bin/switch.sh
#cp $INST_DIR/ubuntu/install/kubernetes/switch-config.yaml /home/kasm-user/.kube/
chown -R 1000:0 /home/kasm-user

