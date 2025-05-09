export PATH="/usr/local/homebrew/bin:/usr/local/sbin:$PATH:$HOME/.depot_tools:$HOME/.asdf/installs/rust/1.62.1/env:/opt/homebrew/bin:/opt/homebrew/coreutils/libexec/gnubin"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pz_simple"

export BAT_THEME="TwoDark"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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

export ZSH_DISABLE_COMPFIX=true

# fzf initializer
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby bundler macos forklift battery brew docker docker-compose emoji zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Load RVM into a shell session *as a function*
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# ZSH / BASH users
# # Add this to your .env, .bashrc, .zshrc, or whatever file you're using for environment

# Enable tmux color scheme http://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode
alias tmux="tmux -2"
  
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# ctrl-z to switch between command-line and vim.
fancy-ctrl-z () {
        if [[ $#BUFFER -eq 0 ]]; then
                BUFFER="fg"
                zle accept-line
        else
                zle push-input
                zle clear-screen
        fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source $HOME/.env-local
. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh


# Android
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home
export JAVA_HOME=$(asdf where java)
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_NDK=$HOME/Library/Android/android-ndk-r23
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/peter.zhang/.miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/peter.zhang/.miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/peter.zhang/.miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/peter.zhang/.miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/peter.zhang/.miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/peter.zhang/.miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

# Setting PATH for Pandora
export DJIPANDORA_BIN="/Users/peter.zhang/.djipandora/bin"
export PATH="${PATH}:${DJIPANDORA_BIN}"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
