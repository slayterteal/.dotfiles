#!/bin/zsh

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

if [[ -z $CONFIG ]]; then
    CONFIG=$HOME/.config
fi

# === Setup Simlinks here ===
# Try to keep things in alphabetical order

# BASHRC
ln -s $DOTFILES/.bashrc $HOME

# NVIM 
ln -s $DOTFILES/nvim $CONFIG/nvim

# OH-MY-ZSH
ln -s $DOTFILES/.oh-my-zsh $HOME

# TMUX
ln -s $DOTFILES/.tmux.conf $HOME

# WEZTERM
ln -s $DOTFILES/.wezterm.lua $HOME

# ZSH
ln -s $DOTFILES/.zshrc $HOME
ln -s $DOTFILES/.zshenv $HOME
