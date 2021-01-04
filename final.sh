#!/bin/bash
# Final user setup for Kali. Everything required for interactivitymkdir Documents
cd /home/mttaggart
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

git clone https://github.com/neox41/WinEnum.git
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
git clone https://github.com/mzet-/linux-exploit-suggester.git
git clone https://github.com/jondonas/linux-exploit-suggester-2.git
git clone https://github.com/BC-SECURITY/Empire.git
git clone https://github.com/powerline/fonts
git clone https://github.com/LasCC/Hack-Tools

# Setup Shell
curl -kL https://get.oh-my.fish | fish
fish -c "omf install bobthefish"
echo "set -x PATH \$PATH /home/mttaggart/.cargo/bin" >> /home/mttaggart/.config/fish/config.fish

# Tmux
git clone https://github.com/tmux-plugins/tpm /home/mttaggart/.tmux/plugins/tpm
curl -fkLo /home/mttaggart/.tmux.conf --create-dirs \ 
"https://gist.githubusercontent.com/mttaggart/e33b55646ddd49de9dcdb8afe8beaa7c/raw/ed756f9acbeec3400a4f16a5b9ea9e3077eee3a0/tmux.conf"

# Vim
curl -fkLo /home/mttaggart/.vim/autoload/plug.vim --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

curl -fkLo /home/mttaggart/.vimrc \
"https://gist.githubusercontent.com/mttaggart/b788e618eddca83a9c033572bfdf3c76/raw/5541038c6539ef2b2c4d4075debc544c5253cde3/.vimrc"

sudo python3 /home/mttaggart/.vim/plugged/youcompleteme/install.py
