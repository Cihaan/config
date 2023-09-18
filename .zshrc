# zsh/functions/p
# determine package manager and run command with it
p() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}

#
# pnpm
export PNPM_HOME="/home/cihan/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
#
#
#th to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"



#
## Set name of the theme to load --- if set to "random", it will
## load a random theme each time oh-my-zsh is loaded, in which case,
## to know which specific one was loaded, run: echo $RANDOM_THEME
## See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#
## Set list of themes to pick from when loading at random
## Setting this variable when ZSH_THEME=random will cause zsh to load
## a theme from this variable instead of looking in $ZSH/themes/
## If set to an empty array, this variable will have no effect.
## ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
#
## Uncomment the following line to use case-sensitive completion.
## CASE_SENSITIVE="true"
#
## Uncomment the following line to use hyphen-insensitive completion.
## Case-sensitive completion must be off. _ and - will be interchangeable.
## HYPHEN_INSENSITIVE="true"
#
## Uncomment one of the following lines to change the auto-update behavior
## zstyle ':omz:update' mode disabled  # disable automatic updates
## zstyle ':omz:update' mode auto      # update automatically without asking
## zstyle ':omz:update' mode reminder  # just remind me to update when it's time
#
## Uncomment the following line to change how often to auto-update (in days).
## zstyle ':omz:update' frequency 13
#
## Uncomment the following line if pasting URLs and other text is messed up.
## DISABLE_MAGIC_FUNCTIONS="true"
#
## Uncomment the following line to disable colors in ls.
## DISABLE_LS_COLORS="true"
#
## Uncomment the following line to disable auto-setting terminal title.
## DISABLE_AUTO_TITLE="true"
#
## Uncomment the following line to enable command auto-correction.
## ENABLE_CORRECTION="true"
#
## Uncomment the following line to display red dots whilst waiting for completion.
## You can also set it to another string to have that shown instead of the default red dots.
## e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
## Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
## COMPLETION_WAITING_DOTS="true"
#
## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
## DISABLE_UNTRACKED_FILES_DIRTY="true"
#
## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## You can set one of the optional three formats:
## "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## or set a custom format using the strftime function format specifications,
## see 'man strftime' for details.
## HIST_STAMPS="mm/dd/yyyy"
#
## Would you like to use another custom folder than $ZSH/custom?
## ZSH_CUSTOM=/path/to/new-custom-folder
#
## Which plugins would you like to load?
## Standard plugins can be found in $ZSH/plugins/
## Custom plugins may be added to $ZSH_CUSTOM/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)
# 
## zsh-autosuggestions zsh-autocomplete)
## zsh-syntax-highlighting
## fast-syntax-highlighting
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

alias vim="nvim"
alias up="sudo apt update && sudo apt install"

function notes() {
  local notes_dir="$HOME/Documents/Notes"
  local timestamp="$(date +%Y-%m-%d_%H-%M-%S)"
  local meeting_name="${1}"
  local note_file="${notes_dir}/${meeting_name}.md"

  # Create the notes directory if it doesn't exist
  mkdir -p "$notes_dir"

  # Open Vim to take notes
  vim "$note_file"
}

export VISUAL=nvim
export EDITOR=nvim

## TMUX
alias tma="tmux a"
alias tmx="tmux new"

alias ag="alias | grep $1"

alias bat="batcat"

bindkey '^[[Z' autosuggest-accept
# bindkey '\t' expand-or-complete

## Ranger
run_ranger () {
    echo
        ranger --choosedir=$HOME/.rangerdir < $TTY
            LASTDIR=`cat $HOME/.rangerdir`
                cd "$LASTDIR"
                    zle reset-prompt
                    }

                    zle -N run_ranger
                    bindkey '^f' run_ranger

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cihan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cihan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cihan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cihan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

