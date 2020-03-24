# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cguertz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    helm 
    docker 
    kubectl
    zsh-completions 
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

function ks {
   case "$1" in
     k)
        export KUBECONFIG=~/.kube/config
        ;;
     as)
	export KUBECONFIG=~/Documents/Work/Infra/config/cluster/k8s-artifex-cluster-staging-kubeconfig.yaml
	;;
     ap)
        export KUBECONFIG=~/Documents/Work/Infra/config/cluster/k8s-artifex-cluster-kubeconfig.yaml
        ;;
     *)
        echo "Utilisation: $0 {k|as|ap}"
        ;;
   esac
}

function goto {
   case "$1" in
     work)
         cd ~/Documents/Work
         ;;
     infra)
         cd ~/Documents/Work/Infra
         ;;
     ets)
	 cd ~/Documents/ETS
	 ;;
     sesh)
	 cd ~/Documents/ETS/Session4
	 ;;
     perso)
	 cd ~/Documents/Perso
	 ;;
     cedille)
	 cd ~/Documents/ETS/Cedille
	 ;;
     infrac)
	 cd ~/Documents/ETS/Cedille/cloud-sre
	 ;;
     *)
    echo "Utilisation: $0 {work|infra|infrac|ets|cedille|perso}"
    ;;
   esac
}

export GOPATH=$HOME/go
export GO111MODULE="on"
alias cat=bat
export KUBECONFIG=~/.kube/config
eval "$(starship init zsh)"
emulate sh -c 'source /etc/profile'
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
[ -f ~/.docker_aliases ] && source ~/.docker_aliases

unset ZLE_RPROMPT_INDENT
#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PWD/node_modules/.bin/:$PATH"

# Command highlight && Completion.
autoload -Uz compinit # && compinit
source /home/$USER/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# # fnm
export PATH=/home/$USER/.fnm:$PATH
eval "`fnm env --multi`"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cguertz/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cguertz/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cguertz/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cguertz/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
