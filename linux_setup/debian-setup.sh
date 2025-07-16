#!/bin/bash
# In order to run this file the .dotfile repo has to be downloaded
# so I can make the assumption that git is installed and configured

# always update!
sudo apt update
sudo apt upgrade

# installing some prereqs
sudo apt install build-essential
sudo apt install vim
sudo apt install curl
sudo apt install man-db # install the "man" command (man ip) etc.
sudo apt install fontconfig

#install some pkgs that I like
sudo apt install net-tools
sudo apt install zsh zplug
sudo apt install libevent ncurses tmux
sudo apt install ripgrep
sudo apt install wget
sudo apt install unzip

# install nerd font
# not certain if this is actually necessary for wsl installs...
if [[ ! -d "../.local/share/fonts" ]]; then
	mkdir -p "../.local/share/fonts"
fi
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/GeistMono.zip
unzip ~/.local/share/fonts/GeistMono.zip -d ~/.local/share/fonts
rm -f ~/.local/share/fonts/GeistMono.zip
fc-cache fv


# change default shell to "zsh"
chsh -s $(which zsh)

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Run the Linix config script
sudo ../linux-symlink.sh

# change to the zsh terminal
zsh

# done!