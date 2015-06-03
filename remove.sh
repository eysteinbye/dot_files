#!/bin/bash

# Add the vimrc
vim_rc="$HOME/.vimrc"
if [ -L $vim_rc ]; then
	echo "Removing old symlink for .vimrc"
	rm ~/.vimrc
	mv ~/.vimrc.backup ~/.vimrc
fi

# Make sure user has OhMyZsh
zsh_rc="$HOME/.zshrc"
if [ -L $zsh_rc ]; then
	echo "Removing old symlink for .zshrc"
	rm ~/.zshrc
	mv ~/.zshrc.backup ~/.zshrc
fi

# ------ Screen
screen_rc="$HOME/.screenrc"
if [ -L $screen_rc ]; then
	echo "Removing old symlink for .screenrc"
	rm ~/.screenrc
	mv ~/.screenrc.backup ~/.screenrc
fi

echo "Remove the .dot_files directory"
rm -rf ~/.dot_files
