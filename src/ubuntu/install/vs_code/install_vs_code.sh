#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/x64/g')
wget -q https://update.code.visualstudio.com/latest/linux-deb-${ARCH}/stable -O vs_code.deb
apt-get update
apt-get install -y ./vs_code.deb
mkdir -p /usr/share/icons/hicolor/apps
wget -O /usr/share/icons/hicolor/apps/vscode.svg https://kasm-static-content.s3.amazonaws.com/icons/vscode.svg
sed -i '/Icon=/c\Icon=/usr/share/icons/hicolor/apps/vscode.svg' /usr/share/applications/code.desktop
sed -i 's#/usr/share/code/code#/usr/share/code/code --no-sandbox##' /usr/share/applications/code.desktop
cp /usr/share/applications/code.desktop $HOME/Desktop
chmod +x $HOME/Desktop/code.desktop
chown 1000:1000 $HOME/Desktop/code.desktop
rm vs_code.deb

# Conveniences for python development
apt-get update
apt-get install -y python3-setuptools \
                   python3-venv \
                   python3-virtualenv

echo "------------------------------------------------------ common extensions"
code --install-extension  --no-sandbox --user-data-dir kasm-user mhutchie.git-graph
code --install-extension  --no-sandbox --user-data-dir kasm-user ms-vscode-remote.remote-ssh
code --install-extension  --no-sandbox --user-data-dir kasm-user redhat.vscode-yaml
code --install-extension  --no-sandbox --user-data-dir kasm-user mechatroner.rainbow-csv
code --install-extension  --no-sandbox --user-data-dir kasm-user formulahendry.auto-close-tag
code --install-extension  --no-sandbox --user-data-dir kasm-user formulahendry.auto-rename-tag
code --install-extension  --no-sandbox --user-data-dir kasm-user anteprimorac.html-end-tag-labels
code --install-extension  --no-sandbox --user-data-dir kasm-user abusaidm.html-snippets
code --install-extension  --no-sandbox --user-data-dir kasm-user sndst00m.vscode-native-svg-preview
code --install-extension  --no-sandbox --user-data-dir kasm-user pranaygp.vscode-css-peek
code --install-extension  --no-sandbox --user-data-dir kasm-user anseki.vscode-color
echo "------------------------------------------------------ themes"
code --install-extension  --no-sandbox --user-data-dir kasm-user armandphilippot.coldark
code --install-extension  --no-sandbox --user-data-dir kasm-user RobbOwen.synthwave-vscode
code --install-extension  --no-sandbox --user-data-dir kasm-user nadim-vscode.infinity-dark-theme
code --install-extension  --no-sandbox --user-data-dir kasm-user emroussel.atomize-atom-one-dark-theme
code --install-extension  --no-sandbox --user-data-dir kasm-user teabyii.ayu
code --install-extension  --no-sandbox --user-data-dir kasm-user wesbos.theme-cobalt2
code --install-extension  --no-sandbox --user-data-dir kasm-user github.github-vscode-theme
code --install-extension  --no-sandbox --user-data-dir kasm-user armandphilippot.coldark
code --install-extension  --no-sandbox --user-data-dir kasm-user radiolevity.search-lights
code --install-extension  --no-sandbox --user-data-dir kasm-user vladeeg.vscode-theme-vlight
code --install-extension  --no-sandbox --user-data-dir kasm-user akamud.vscode-theme-onelight
code --install-extension  --no-sandbox --user-data-dir kasm-user akamud.vscode-theme-onedark
code --install-extension  --no-sandbox --user-data-dir kasm-user rubjo.ultimate-dark-neo
code --install-extension  --no-sandbox --user-data-dir kasm-user sainnhe.edge
code --install-extension  --no-sandbox --user-data-dir kasm-user circleci.circleci
code --install-extension  --no-sandbox --user-data-dir kasm-user lakshitsomani.best-themes-redefined
code --install-extension  --no-sandbox --user-data-dir kasm-user usernamehw.prism
code --install-extension  --no-sandbox --user-data-dir kasm-user ms-azuretools.vscode-docker
echo "------------------------------------------------------ icons"
code --install-extension  --no-sandbox --user-data-dir kasm-user emroussel.atom-icons
code --install-extension --no-sandbox --user-data-dir kasm-user laurenttreguier.vscode-simple-icons
echo "------------------------------------------------------ DevOPS"
code --install-extension --no-sandbox --user-data-dir kasm-user samuelcolvin.jinjahtml
code --install-extension --no-sandbox --user-data-dir kasm-user redhat.ansible
code --install-extension --no-sandbox --user-data-dir kasm-user hashicorp.terraform

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/*
fi
