export PATH="$HOME/.symfony5/bin:$PATH"
#
# sync config/home config with github/home
up_home() {
    cd ~/Projects/config/ \
    && git pull origin main \
    && cp ~/Projects/config/.zshrc ~/.zshrc \
    && cp ~/Projects/config/.ideavimrc ~/.ideavimrc \
    && cd --
}
up_config() {
    cd ~/Projects/config/ \
    && git pull origin main \
    && cp ~/.zshrc ~/Projects/config/.zshrc \
    && cp ~/.ideavimrc ~/Projects/config/.ideavimrc \
    && git add . \
    && git commit -m "%Y-%m-%d-%H-%M" \
    && git push \
    && cd --
}
# personal scripts path
#
# end personal scripts path
export PATH="$PATH:/opt/my-scripts"
#
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
export ZSH="$HOME/.oh-my-zsh"
#
# nvim
#
# # Updates the Neovim configuration with mine
 function nup() {
     # Define the project directory and repository URL
     PROJECT_DIR="$HOME/Projects/config"
     REPO_URL="https://github.com/Cihaan/config.git"

     # Define the Neovim configuration path and the backup path
     NVIM_CONFIG_PATH="$HOME/.config/nvim/lua"
     BACKUP_PATH="$HOME/.config/nvim/lua_backup"

     # Define colors
     RED='\033[0;31m'
     GREEN='\033[0;32m'
     BLUE='\033[0;34m'
     NC='\033[0m' # No Color

     echo -e "${BLUE}Starting the update process...${NC}"

     # Check if the project directory exists
     if [ ! -d "$PROJECT_DIR" ]; then
         echo -e "${BLUE}\n--- CLONING THE REPOSITORY ---${NC}"
         echo "Project directory does not exist. Cloning the repository..."
         # Clone the repository if the directory doesn't exist
         if git clone $REPO_URL $PROJECT_DIR; then
             echo -e "${GREEN}Repository cloned successfully.${NC}"
         else
             echo -e "${RED}Failed to clone the repository.${NC}"
             return 1
         fi
     else
         echo -e "${BLUE}\n--- UPDATING THE REPOSITORY ---${NC}"
         # Change to the project directory
         cd $PROJECT_DIR || return
         echo "Changed to project directory: $PROJECT_DIR"

         # Fetch all branches and pull the latest changes
         echo "Fetching all branches..."
         if git fetch --all --prune; then
             echo "Pulling the latest changes..."
             if git pull --rebase; then
                 echo -e "${GREEN}Latest changes pulled successfully.${NC}"
             else
                 echo -e "${RED}Failed to pull the latest changes.${NC}"
                 return 1
             fi
         else
             echo -e "${RED}Failed to fetch branches.${NC}"
             return 1
         fi
     fi

     echo -e "${BLUE}\n--- BACKING UP EXISTING CONFIGURATION FILES ---${NC}"
     # Backup existing nvim configuration files
     echo "Backing up existing Neovim configuration files..."
     if [ -d $NVIM_CONFIG_PATH ]; then
         if cp -r $NVIM_CONFIG_PATH $BACKUP_PATH; then
             echo -e "${GREEN}Neovim configuration files backed up successfully to the following location:${NC}"
             echo "$BACKUP_PATH"
         else
             echo -e "${RED}Failed to back up the Neovim configuration files.${NC}"
             return 1
         fi
     fi

     echo -e "${BLUE}\n--- COPYING NEW CONFIGURATION FILES ---${NC}"
     # Copy the nvim configuration files
     echo "Copying the Neovim configuration files..."
     if cp -r nvim/lua $NVIM_CONFIG_PATH; then
         echo -e "${GREEN}Neovim configuration files copied successfully.${NC}"
     else
         echo -e "${RED}Failed to copy the Neovim configuration files.${NC}"
         return 1
     fi

     echo -e "${BLUE}\n--- OPENING NEOVIM ---${NC}"
     # Ask the user if they want to open nvim
     echo "Would you like to open NeoVim to install the new packages? [Y/n]"
     vared -p '' -c response
     if [[ "$response" =~ ^([yY][eE][sS]|[yY]|"")$ ]]
     then
         echo "Opening Neovim..."
         if nvim; then
             echo -e "${GREEN}Update process completed successfully.${NC}"
         else
             echo -e "${RED}Failed to open Neovim.${NC}"
             return 1
         fi
     else
         echo -e "${GREEN}Update process completed successfully.${NC}"
     fi
 }

# end nvim
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting docker docker-compose)
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
#
alias vim="nvim"
#
alias explorer="nautilus . &"
#
alias rm="trash-put"
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
## TMUX
alias tma="tmux a"
alias tmx="tmux new"
#
alias ag="alias | grep $1"
#
bindkey '^[[Z' autosuggest-accept
#
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
#
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
