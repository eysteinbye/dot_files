# My OS X dot.files

## Work in progress


NB! Change to use GNU Stow for dotfiles

Get all apps to use: $XDG_CONFIG_HOME
https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

https://github.com/shakeelmohamed/stow-dotfiles

---

This is the dot.files I use on my Mac. Might not be the right for you :)



## Prerequisites

1. HomeBrew
2. Install Alacritty - `brew install alacritty`
3. Oh-my-Zsh - To the .config folder
4. Tmux - `brew install tmux`
5. Fzf - `brew install fzf`
6. Zoxide - `brew install zoxide`


## Alacritty
Certificate setup for Alacritty on macOS
https://github.com/alacritty/alacritty/wiki/Self-Signing-Alacritty-on-macOS


## Installation

$ git clone git@github.com:eysteinbye/dot_files.git ~/.dot_files && ~/.dot_files/setup.sh

NB! Copy the .config folder to $XDG_CONFIG_HOME

### Quick View

[A collection of plugins](https://github.com/sindresorhus/quick-look-plugins)

This Markdown viewer is also good!
[QuickLook Markdown files in Finder](http://inkmarkapp.com/markdown-quick-look-plugin-mac-os-x/)


### Other tools

- Neovim - `brew install neovim`
- ag - Silver Searcher - `brew install ag`
- tree - `brew install tree`
- jq - `brew install jq`
- fd - `brew install fd`
- fzf - `brew install fzf`
- bat - `brew install bat`

### Themes
Catppuccin has great themes for Tmux, NeoVim, Bat, LogSeq
https://github.com/catppuccin


### Scripts

[Some scripts like ql](https://github.com/morgant/tools-osx)

#### Mac Trach
```bash

brew install macos-trash
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

```
