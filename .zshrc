# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
export PATH=~/.npm-global/bin:$PATH
#
# pnpm
# export PNPM_HOME="/home/cihan/.local/share/pnpm"
# export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
#
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting docker docker-compose)
# 
source $ZSH/oh-my-zsh.sh
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
