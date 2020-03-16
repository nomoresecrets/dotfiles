# Setup fzf
# ---------
if [[ ! "$PATH" == */home/schrukke/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/schrukke/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/schrukke/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/schrukke/.fzf/shell/key-bindings.bash"
