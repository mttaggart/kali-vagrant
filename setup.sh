#!/bin/bash

# Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install distro stuff
apt update
apt upgrade
apt install -y cmake fish terminator gedit python3-pip radare2 brave-browser vim-gtk3 alien

# Install Python Stuff
pip3 install jupyterlab stegoveritas pwntools pandas plotly ipywidgets
jupyter labextension install jupyterlab-plotly

# Set user
useradd -m -s /usr/bin/fish mttaggart
gpasswd -a mttaggart sudo

# Move final script into place
mv /tmp/final.sh /home/mttaggart/final.sh
chown mttaggart:mttaggart /home/mttaggart/final.sh
chmod +x /home/mttaggart/final.sh
