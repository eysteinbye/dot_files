
# Set config folder
export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="eystein"
#ZSH_THEME="superjarin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# GIT Alias 
alias lg1="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# Use NeoVim 
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias vimdiff='nvim -d'
export EDITOR=nvim


alias cat="bat -p"


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

eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(zoxide init --cmd cd zsh)"

# Check if we are in a tmux session
# If not, start a new one
if [ -z "$TMUX" ]; then
  t # alias for zfz-tmux selector
fi
