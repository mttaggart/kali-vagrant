#!/bin/bash

# Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install distro stuff
sudo -i
export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y cmake fish terminator gedit python3-pip radare2 brave-browser vim-gtk3 alien gparted

# Install Python Stuff
pip3 install jupyterlab stegoveritas pwntools pandas plotly ipywidgets
jupyter labextension install jupyterlab-plotly

# Set user
useradd -m -s /usr/bin/fish mttaggart
gpasswd -a mttaggart sudo

# Final user setup for Kali. Everything required for interactivity
su mttaggart
cd /home/mttaggart
mkdir Documents
mkdir Downloads
mkdir Documents
mkdir Scripts

cd Downloads
# Get Zenmap
wget "https://nmap.org/dist/zenmap-7.91-1.noarch.rpm"
sudo alien -d zenmap-7.91-1.noarch.rpm
sudo dpkg -i zenmap*.deb
rm zenmap*
cd ..

# Setup rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
/home/mttaggart/.cargo/bin/cargo install rustscan 
/home/mttaggart/.cargo/bin/cargo install feroxbuster

chown -R mttaggart:mttaggart /home/mttaggart
chmod +x /tmp/final.sh

echo "Initial setup done; run /tmp/final.sh as user to finish"
