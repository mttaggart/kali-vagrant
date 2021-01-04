#!/bin/bash

# Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install distro stuff
apt update
apt upgrade
apt install fish terminator gedit python3-pip radare2 brave-browser vim-gtk3

# Install Python Stuff
pip3 install jupyterlab stegoveritas pwntools libimage-exiftool-perl

# Set user
useradd mttaggart -m -s /usr/bin/fish
passwd mttaggart
su mttaggart

# Setup rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install rustscan 
cargo install feroxbuster

#GitHub Stuff
cd /home/mttaggart/Documents
mkdir Scripts
cd Scripts

git clone git@github.com:neox41/WinEnum.git
git clone git@github.com:rebootuser/LinEnum.git
git clone git@github.com:carlospolop/privilege-escalation-awesome-scripts-suite.git
git clone git@github.com:mzet-/linux-exploit-suggester.git
git clone git@github.com:jondonas/linux-exploit-suggester-2.git
git clone git@github.com:BC-SECURITY/Empire.git

# Setup Shell
curl -L https://get.oh-my.fish | fish
omf install bobthefish

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.tmux.conf \ 
    https://gist.githubusercontent.com/mttaggart/e33b55646ddd49de9dcdb8afe8beaa7c/raw/ed756f9acbeec3400a4f16a5b9ea9e3077eee3a0/tmux.conf

# Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vimrc \
    https://gist.githubusercontent.com/mttaggart/b788e618eddca83a9c033572bfdf3c76/raw/5541038c6539ef2b2c4d4075debc544c5253cde3/.vimrc
