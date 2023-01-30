#!/bin/bash

echo "安装基础工具"
sudo apt update
sudo apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim -y
sudo apt update
sudo apt install nodejs -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install npm -y
sudo apt install lua5.4 -y
sudo npm  install n -g
sudo apt-get install powerline -y

echo "安装nvim 插件"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp -r ./nvim/init.vim  ~/.config/nvim/init.vim

echo "安装zsh"
sudo apt install zsh -y

echo "配置zsh"
mkdir -p ~/.config
pushd ~/.config
git clone https://github.com/hntoitx/omz
mkdir -p ~/.config/omz/cache
echo "source ~/.config/omz/omz.zsh" >> ~/.zshrc
popd

echo "安装展示更好效果软件"
sudo apt install fd-find -y && ln -s $(which fdfind)
sudo apt install bat -y
sudo apt install exa -y
sudo apt install ueberzug -y

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.zshrc
chsh /bin/zsh
