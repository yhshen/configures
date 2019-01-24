#! /usr/bin/env bash
#
# start.sh
# Copyright (C) 2018 yhshen <yhshen@yhshen-amd2700X>
#
# Distributed under terms of the MIT license.
#
set -x 

# zsh

sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python-dev python-pip python3-dev
sudo apt-get install python3-setuptools
sudo easy_install3 pip
sudo apt-get install shadowsocks-qt5 git zsh curl

sudo pip install genpac
pip install --upgrade genpac

sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update

genpac --pac-proxy "SOCKS5 127.0.0.1:25554" >~/.gfwlist.pac

#zsh oh-my-zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp `readlink -f $0`/.zshrc ~/.zshrc
source ~/.zshrc

#zsh 256color
cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color

# highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source `pwd`/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

# autojump
git clone git://github.com/wting/autojump.git && cd autojump && ./install.py && cd ..
echo "[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc
source ~/.zshrc

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# zsh auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions 
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" >> ~/.zshrc
source ~/.zshrc

# nvim
sudo apt-get install neovim

if [[ $? -ne 0 ]]; then
    printf "install neovim failed, exit 0"
    exit -1
fi

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

mkdir -p ~/.config/nvim/
cp `dirname $(readlink -f $0)`/init.vim ~/.config/nvim/

sudo apt-get install silversearcher-ag

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins with vim-plug
vim +slient +PlugInstall +qall
pip install neovim

# compile Ycm
sudo apt-get install cmake
cd ~/.local/share/nvim/plugged/YouCompleteMe && ./install.py --all

# ubuntu terminal theme
sudo apt-get install dconf-cli
bash -c  "$(wget -qO- https://git.io/vQgMr)"

# gnome3
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell ubuntu-gnome-desktop
