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
