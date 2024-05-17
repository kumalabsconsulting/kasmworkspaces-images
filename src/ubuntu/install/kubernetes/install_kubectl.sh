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

curl -L https://github.com/hidetatz/kubecolor/releases/download/v0.0.25/kubecolor_0.0.25_Linux_x86_64.tar.gz -o /root/kubecolor_0.0.25_Linux_x86_64.tar.gz
tar -xzvf /root/kubecolor_0.0.25_Linux_x86_64.tar.gz && cp kubecolor /usr/local/bin/ 
chmod +x /usr/local/bin/kubecolor
rm -rf /root/kubec*

## Fix ownership
chown -R 1000:0 /home/kasm-user

