#!/usr/bin/env bash
set -ex
# https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/
# https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md

OS=linux                        # Pick the right os: linux, darwin (intel only)
VERSION=0.7.0                   # Pick the current version.


if grep -q "ID=debian" /etc/os-release; then
  curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" 
  install -c -m 0755 vcluster /usr/local/bin
  rm -f vcluster
  vcluster --version
else
  curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" 
  install -c -m 0755 vcluster /usr/local/bin
  rm -f vcluster
  vcluster --version
fi
