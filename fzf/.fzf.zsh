# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/peterzhang/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/peterzhang/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/peterzhang/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/peterzhang/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
