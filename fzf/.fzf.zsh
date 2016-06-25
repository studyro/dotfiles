# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/zhangstudyro/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/zhangstudyro/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/zhangstudyro/.fzf/man* && -d "/Users/zhangstudyro/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/zhangstudyro/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/zhangstudyro/.fzf/shell/completion.zsh" 2> /dev/null

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export FZF_TMUX_HEIGHT=30%

# Key bindings
# ------------
source "/Users/zhangstudyro/.fzf/shell/key-bindings.zsh"

