#!/usr/bin/env bash
set -ex

# Install Darktable from repo ppa
add-apt-repository ppa:ubuntuhandbook1/darktable
apt-get update
apt install darktable


## Desktop file setup
#sed -i "s@Exec=/usr/share/darktable/Darktable@Exec=/usr/share/darktable/darktable"  /usr/share/applications/darktable.desktop
#cp /usr/share/applications/darktable.desktop $HOME/Desktop/
#chmod +x $HOME/Desktop/darktable.desktop

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
    apt-get autoclean
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
fi
