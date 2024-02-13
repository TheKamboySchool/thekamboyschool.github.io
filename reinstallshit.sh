#!/bin/bash

# Install Helix
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix

# Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit lazygit.tar.gz

# Get Helix Config
git clone https://github.com/TheKamboySchool/gitpod_helix_config ~/.config/helix

# Install vscode-servers
npm i -g vscode-langservers-extracted

# Setup Helix Tree Sitter
hx -g fetch
hx -g build

# Done MSG
echo "Finished!"
