# Security for prevent messy user
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# Everybody like colors
alias dir='dir --color=auto'
alias dmesg='dmesg --color'
alias less='less -r'
alias ls='ls --color=always'
alias grep='grep --color=auto'
export LS_COLORS="di=1;36:ln=1;31:so=37:pi=1;35:ex=37:bd=37:cd=37:su=37:sg=37:tw=1;36:ow=1;36"

# Terminal choice
export TERMINAL="cool-retro-term"

# Global editor, user choice
export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR="$VISUAL"

# Set vi mode on bash
set -o vi

# Correct tmux color problem
alias tmux='tmux -2'

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

# CLI color definition
BLUE="\e[34;1m"
CYAN="\e[36;1m"
GREEN="\e[32;1m"
RED="\e[31;1m"
YELLOW="\e[33;1m"
WHITE="\e[97m"
RESET="\e[m"
NEW_LINE="\\n"

# Source the git completion script
GIT_COMPLETION=/usr/share/git/completion/git-prompt.sh
if [ ! -f $GIT_COMPLETION ]; then
    GIT_COMPLETION=~/.git-prompt.sh
    if [ ! -f $GIT_COMPLETION ]; then
        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
    fi
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_HIDE_IF_PWD_IGNORED=true
GIT_PS1_SHOWCOLORHINTS=true
source $GIT_COMPLETION
# This is what actually sets our PS1.
PS1="\[$RESET\]┌─\[$BLUE\]\u\[$RESET\]@\[$RED\]\h\[$RESET\]─\[$YELLOW\]\w$NEW_LINE\[$RESET\]└─\[$GREEN\][\D{%F %R}]\[$CYAN\]\$(__git_ps1) \[$WHITE\]$ \[$RESET\]"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

