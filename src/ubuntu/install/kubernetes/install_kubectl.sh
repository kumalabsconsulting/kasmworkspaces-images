#!/usr/bin/env bash
set -ex
# https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/
# https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md

OS=linux                        # Pick the right os: linux, darwin (intel only)
VERSION=0.7.0                   # Pick the current version.


if grep -q "ID=debian" /etc/os-release; then
  apt-get update && sudo apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
  curl https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz -o k9s_Linux_amd64.tar.gz
  tar -xzvf k9s_Linux_amd64.tar.gz k9s -C /usr/local/bin/
  chmod +x /usr/local/bin/k9s
  rm -rf k9s*
  apt-get update
  apt-get install -y kubectl fzf
  curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${OS}_amd64
  chmod +x /usr/local/bin/switcher
  curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh
  chmod +x /usr/local/bin/switch.sh
  cp $INST_DIR/ubuntu/install/kubernetes/switch-config.yaml /home/kasm-user/.kube/
  chown -R 1000:0 /home/kasm-user
else
  curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mv ./kubectl /usr/local/bin/kubectl
  curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns && chmod +x $_
  curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${OS}_amd64
  chmod +x /usr/local/bin/switcher
  curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh
  chmod +x /usr/local/bin/switch.sh
  cp $INST_DIR/ubuntu/install/kubernetes/switch-config.yaml /home/kasm-user/.kube/
  curl https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz -o k9s_Linux_amd64.tar.gz
  tar -xzvf k9s_Linux_amd64.tar.gz k9s -C /usr/local/bin/
  chmod +x /usr/local/bin/k9s
  rm -rf k9s*
  chown -R 1000:0 /home/kasm-user
fi
