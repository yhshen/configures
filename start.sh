#! /usr/bin/env bash
#
# start.sh
# Copyright (C) 2018 yhshen <yhshen@yhshen-amd2700X>
#
# Distributed under terms of the MIT license.
#
# set -x 

# zsh

sudo apt-get install git autojump zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp `readlink -f $0`/.zshrc ~/.zshrc

# highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ~/.zshrc

# nvim

sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo apt-get install python-dev python-pip python3-dev
sudo apt-get install python3-setuptools
sudo easy_install3 pip

sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

cp `readlink -f $0`/init.vim ~/.config/nvim/
