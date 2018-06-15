# xinit
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim=nvim

# Android
export ANDROID_SDK=~/Android/Sdk

# oh-my-zsh

export ZSH=~/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(
  git
)

DEFAULT_USER=jms

source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR=~/.nvm
source $NVM_DIR/nvm.sh

# rustup
source ~/.cargo/env

# go
export GOPATH=~/go

# Path
PATH+=:~/.local/bin
PATH+=:~/.gem/ruby/2.4.0/bin
PATH+=:$ANDROID_SDK/tools/bin:$ANDROID_SDK/platform-tools
PATH+=:$NVM_BIN
PATH+=:$GOPATH/bin
export PATH

