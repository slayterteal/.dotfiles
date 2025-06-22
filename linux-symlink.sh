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
# oh-my-zsh is a git repo itself, and I'm not managing it 
# as a submodule
# ln -s $DOTFILES/.oh-my-zsh $HOME

# TMUX
ln -s $DOTFILES/.tmux.conf $HOME

# WEZTERM
ln -s $DOTFILES/.wezterm.lua $HOME

# ZSH
ln -s $DOTFILES/.zshrc $HOME
ln -s $DOTFILES/.zshenv $HOME

# if on mac set the VSCode settings in the correct spot
if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s $DOTFILES/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json" 
fi