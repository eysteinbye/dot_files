#!/bin/bash


# ------ VIM

# Make sure user has VIM

# Add the vimrc
vim_rc="$HOME/.vimrc"
if [ -L $vim_rc ]; then
	echo "Removing old symlink for .vimrc"
	rm ~/.vimrc
else	
	echo "Backing up old .vimrc to .vimrc.backup"
	mv ~/.vimrc ~/.vimrc.backup
fi
# Create symlink
ln -s ~/.dot_files/.vimrc ~/.vimrc

# Add color scheme
mkdir ~/.vim/colors
ln -s ~/.dot_files/eystein.vim ~/.vim/colors/eystein.vim


# Setup Vundle for Vim

if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ]; then
	echo "Installing Vundle for Vim"
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# ------ Zsh

# Make sure user has OhMyZsh
zsh_rc="$HOME/.zshrc"
if [ -L $zsh_rc ]; then
	echo "Removing old symlink for .zshrc"
	rm ~/.zshrc
else	
	echo "Backing up old .zshrc to .zshrc.backup"
	mv ~/.zshrc ~/.zshrc.backup
fi
ln -s ~/.dot_files/.zshrc ~/.zshrc

cp ~/.dot_files/eystein.zsh-theme ~/.oh-my-zsh/themes/eystein.zsh-theme

# ------ Screen
screen_rc="$HOME/.screenrc"
if [ -L $screen_rc ]; then
	echo "Removing old symlink for .screenrc"
	rm ~/.screenrc
else	
	echo "Backing up old .screenrc to .screenrc.backup" 
	mv ~/.screenrc ~/.screenrc.backup
fi
ln -s ~/.dot_files/.screenrc ~/.screenrc


