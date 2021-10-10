#!/bin/bash

# Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Install distro stuff

apt update
apt DEBIAN_FRONTEND=noninteractive install -y cmake fish terminator gedit python3-pip radare2 brave-browser vim-gtk3 alien

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

#GitHub Stuff
cd Scripts
wget "https://github.com/rizinorg/cutter/releases/download/v2.0.3/Cutter-v2.0.3-x64.Linux.AppImage"
chmod +x Cutter-v2.0.3-x64.Linux.AppImage 
git clone https://github.com/neox41/WinEnum.git
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
git clone https://github.com/mzet-/linux-exploit-suggester.git
git clone https://github.com/jondonas/linux-exploit-suggester-2.git
git clone https://github.com/BC-SECURITY/Empire.git
git clone https://github.com/powerline/fonts
git clone https://github.com/samratashok/nishang
git clone https://github.com/cobbr/Covenant

cd fonts
chmod +x install.sh
./install.sh
cd ~

# Install dotnet
cd Downloads
wget "https://dot.net/v1/dotnet-install.sh"
chmod +x ./dotnet-install.sh
sudo ./dotnet-install.sh -c Current
rm ./dotnet-install.sh

# Setup Shell
curl -kL https://get.oh-my.fish | fish
fish -c "omf install bobthefish"
echo "set -x PATH \$PATH /home/mttaggart/.cargo/bin" >> /home/mttaggart/.config/fish/config.fish

# Setup Terminator
mkdir ~/.config/terminator
cp /tmp/terminatorconfig ~/.config/terminator/config

# Tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm /home/mttaggart/.tmux/plugins/tpm
curl -fkLo /home/mttaggart/.tmux.conf --create-dirs \ 
"https://gist.githubusercontent.com/mttaggart/e33b55646ddd49de9dcdb8afe8beaa7c/raw/de02a48263c4daaf51ad2fd67059f45d6387d59e/tmux.conf"

# Vim
curl -fkLo /home/mttaggart/.vim/autoload/plug.vim --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

curl -fkLo /home/mttaggart/.vimrc \
"https://gist.githubusercontent.com/mttaggart/6d702f629c469fce5923ba42fde51a73/raw/d66f305444cde49a6dea7a31b49c3798d71c1db4/.vimrc"

