#!/usr/bin/env bash
set -ex

OS=linux                        # Pick the right os: linux, darwin (intel only)
VERSION=0.7.0                   # Pick the current version.

## SWITCHER INSTALL
echo "

############# INSTALLING SWITCHER ######################

"
curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${OS}_amd64
chmod +x /usr/local/bin/switcher
curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh
chmod +x /usr/local/bin/switch.sh
#cp $INST_DIR/ubuntu/install/kubernetes/switch-config.yaml /home/kasm-user/.kube/

## Fix ownership
chown -R 1000:0 /home/kasm-user

