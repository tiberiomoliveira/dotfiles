# Security for prevent messy user
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# Everybody like colors
alias grep='grep --color'

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

source /etc/bash_completion.d/git-prompt
GIT_PS1_SHOWDIRTYSTATE=true
# Creates the bash_prompt function
bash_prompt () {
 
    # This is what actually sets our PS1. The ${git prompt} is what will display our git status.
    PS1="\[\e[0;36m\]┌─\[\e[1;37m\]\u@\h\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\]\w\[\e[1;37m\]$(__git_ps1)\n\[\e[0;36m\]└─\[\e[1;32m\][\D{%F %R}]\[\e[0m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[0;32m\]$\"; else echo \"\[\033[0;31m\]$\"; fi)\[\033[00m\] "
 
}
# PROMPT_COMMAND is run just before the PS1 is printed. We've set it to run our bash_prompt function.
PROMPT_COMMAND=bash_prompt
