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

source $ZSH/oh-my-zsh.sh

# nvm
source /usr/share/nvm/init-nvm.sh

# Path
PATH+=:~/.gem/ruby/2.4.0/bin
PATH+=:$ANDROID_SDK/tools/bin:$ANDROID_SDK/platform-tools
PATH+=:$NVM_BIN
export PATH

