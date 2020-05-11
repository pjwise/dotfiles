#!/bin/bash

cd ~

# Check that zsh is installed
if ! type zsh > /dev/null; then
    echo "zsh not installed. Exiting."
    exit 1
fi

# Check that stow is installed
if ! type stow > /dev/null; then
    echo "stow not installed. Exiting."
    exit 1
fi

# Check that git is installed
if ! type git > /dev/null; then
    echo "git not installed. Exiting."
    exit 1
fi

# Check that tmux is installed
if ! type tmux > /dev/null; then
    echo "tmux not installed. Exiting."
    exit 1
fi

# Check that vim is installed
if ! type vim > /dev/null; then
    echo "vim not installed. Exiting."
    exit 1
fi

# Clear old dotfiles
rm -rf .zshrc .p10k.zsh .oh-my-zsh

# Install oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

cd ~/dotfiles

# Copy dotfiles to home dir
stow terminal

# Make zsh the default shell
chsh -s /bin/zsh

exec zsh