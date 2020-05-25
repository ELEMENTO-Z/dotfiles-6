#!/bin/bash
read -p "All your git, vim, bash, tmux, zsh settings will be deleted [y/n]" CONTINUE

if [[ "$CONTINUE" = "y" ]] || [[ "$CONTINUE" = "Y" ]]; then
    rm -rf ~/.vimrc ~/.vim
    rm -rf ~/.gitconfig ~/.git
    rm -rf ~/.bashrc ~/.bash
    rm -rf ~/.tmux ~/.tmux
    rm -rf ~/.zshrci
fi

read -p "Install vim config [y/n]: " VIM_CONF
if [[ "$VIM_CONF" = "y" ]] || [[ "$VIM_CONF" = "Y" ]]; then
	sudo apt-get install vim vim-gui-common curl -y
	curl -fLo ~.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mv vimrc ~/.vimrc
fi

read -p "Install git config [y/n]: " GIT_CONF
if [[ "$GIT_CONF" = "y" ]] || [[ "$GIT_CONF" = "Y" ]] ; then
	mv gitconfig ~/.gitconfig
	mv gitignore_global ~/.gitignore_global
fi

read -p "Install bash config [y/n]: " BASH_CONF
if [[ "$BASH_CONF" = "y" ]] || [[ "$BASH_CONF" = "Y" ]]; then
	sudo apt-get install bash -y
	mv bashrc ~/.bashrc
fi

read -p "Intall tmux config [y/n]: " TMUX_CONF
if [[ "$TMUX_CONF" = "y" ]] || [[ "$TMUX_CONF" = "y" ]]; then
	sudo apt-get install tmux -y
	mv tmux.conf ~/.tmux.conf
	mv tmux.conf.local ~/.tmux.conf.local
fi

read -p "Install zsh config [y/n]: " ZSH_CONF
if [[ "$ZSH_CONF" = "y" ]] || [[ "$ZSH_CONF" = "Y" ]]; then
	sudo apt-get install zsh curl git -y
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	mv zshrc ~/.zshrc
fi