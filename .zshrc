export PATH="$HOME/.symfony5/bin:$PATH"
#
export PATH="$PATH:/opt/my-scripts"
#
# pnpm
export PNPM_HOME="/home/cihan/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
export ZSH="$HOME/.oh-my-zsh"
#
## Set name of the theme to load --- if set to "random", it will
## load a random theme each time oh-my-zsh is loaded, in which case,
## to know which specific one was loaded, run: echo $RANDOM_THEME
## See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#
## Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting docker docker-compose)
# 
source $ZSH/oh-my-zsh.sh
#
## User configuration
#
## export MANPATH="/usr/local/man:$MANPATH"
#
## You may need to manually set your language environment
## export LANG=en_US.UTF-8
#
## Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi
#
## Compilation flags
## export ARCHFLAGS="-arch x86_64"
#
alias explorer="nautilus . &"
#
alias l='ls -a'
alias ll='ls -la'
#
function dir() {
  mkdir $1 && cd $1
}
#
function c() {
  cd ~/Projects/
}
#
export VISUAL=nvim
export EDITOR=nvim
#
alias ag="alias | grep $1"
#
bindkey '^[[Z' autosuggest-accept
#
#
