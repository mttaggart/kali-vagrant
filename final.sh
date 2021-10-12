#!/bin/bash
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
curl -fkLo /home/mttaggart/.tmux.conf > "https://gist.githubusercontent.com/mttaggart/e33b55646ddd49de9dcdb8afe8beaa7c/raw/de02a48263c4daaf51ad2fd67059f45d6387d59e/tmux.conf"

# Vim
curl -fkLo /home/mttaggart/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

curl -fkLo /home/mttaggart/.vimrc "https://gist.githubusercontent.com/mttaggart/6d702f629c469fce5923ba42fde51a73/raw/d66f305444cde49a6dea7a31b49c3798d71c1db4/.vimrc"


