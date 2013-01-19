# Security for prevent messy user
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# Global editor, user choice
export EDITOR=vim

# Get color support for less
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Use 256 color for terminal
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
