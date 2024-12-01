
# Set config folder
export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="eystein"  # From "superjarin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos brew npm node vim-interaction screen web-search sudo encode64 textmate ssh-agent docker zoxide fzf)

# Load oh my zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:~/.bin"

export MANPATH="/usr/local/man:$MANPATH"

export PATH=/Users/eysteinbye/.local/bin:$PATH
export PATH=/Users/eysteinbye/.script:$PATH

export PATH="$HOME/go/bin:$PATH"

# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# GIT Alias 
alias lg1="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# This is the alias gitclean, written as a function to make it more readable 
gitclean() {
    git branch --delete $(git branch --merged master --no-contains master --format='%(refname:short)')
}

# Use NeoVim 
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias vimdiff='nvim -d'
export EDITOR=nvim


alias cat="bat -p"

alias oncall="gcloud config configurations activate oncall"
alias unoncall="gcloud config configurations activate default"

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
# You may need to manually set your language environment
# export LANG=en_US.UTF-8


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eysteinbye/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eysteinbye/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eysteinbye/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eysteinbye/.google-cloud-sdk/completion.zsh.inc'; fi


# Secretive
export SSH_AUTH_SOCK=/Users/eysteinbye/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Configure shell environment to work with Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


eval "$(zoxide init --cmd cd zsh)"


export ZSH_TMUX_AUTOSTART=true

# Set the prompt from ~/.config/oh-my-zsh/themes/eystein.zsh-theme
PROMPT="$EYSTEIN_PROMPT "