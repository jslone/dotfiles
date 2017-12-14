# Alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim=nvim

# Path
PATH+=:~/.gem/ruby/2.4.0/bin
export PATH

# oh-my-zsh

export ZSH=/home/jms/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
