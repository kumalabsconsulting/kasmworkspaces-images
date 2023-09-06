#!/usr/bin/env bash
set -ex


## VAULT OpenLens
echo "

############# INSTALLING OPENLENS ######################

"

wget -O OpenLens-6.5.2-366.amd64.deb  https://github.com/MuhammedKalkan/OpenLens/releases/download/v6.5.2-366/OpenLens-6.5.2-366.amd64.deb
dpkg --force-confold -i OpenLens-6.5.2-366.amd64.deb 
rm -f OpenLens-6.5.2-366.amd64.deb

## Fix ownership
chown -R 1000:0 /home/kasm-user