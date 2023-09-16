# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Security for prevent messy user
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# Everybody likes colors
alias dmesg='dmesg --color'
export LS_COLORS="di=1;36:ln=1;31:so=37:pi=1;35:ex=37:bd=37:cd=37:su=37:sg=37:tw=1;36:ow=1;36"

# Terminal choice
export TERMINAL="alacritty"

# Global editor, user choice
export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR="$VISUAL"

# Set vi mode on bash
set -o vi

# CLI color definition
BLUE="\e[34;1m"
CYAN="\e[36;1m"
GREEN="\e[32;1m"
RED="\e[31;1m"
YELLOW="\e[33;1m"
WHITE="\e[97m"
RESET="\e[m"
NEW_LINE="\\n"

check_git_script () {
    local GIT_SCRIPT=/usr/share/git/completion/$1
    if [ ! -f "$GIT_SCRIPT" ]; then
        GIT_SCRIPT=~/.$1
        if [ ! -f "$GIT_SCRIPT" ]; then
            curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/$1" -o ~/".$1"
        fi
    fi
    if [ "$1" == "git-prompt.sh" ]; then
        #GIT_PS1_SHOWDIRTYSTATE=1
        #GIT_PS1_SHOWSTASHSTATE=1
        #GIT_PS1_SHOWUNTRACKEDFILES=1
        #GIT_PS1_SHOWUPSTREAM="auto"
        GIT_PS1_HIDE_IF_PWD_IGNORED=1
        GIT_PS1_SHOWCOLORHINTS=1
    fi
    # Source the git script
    # shellcheck source=/usr/share/git/completion/git-prompt.sh
    . $GIT_SCRIPT
}
check_git_script git-completion.bash
check_git_script git-prompt.sh

# This is what actually sets our PS1.
PS1="\[$RESET\]┌─\[$BLUE\]\u\[$RESET\]@\[$RED\]\h\[$RESET\]:\[$YELLOW\]\w$NEW_LINE\[$RESET\]└─\[$GREEN\][\D{%F %R}]\[$CYAN\]"'$(__git_ps1 " (%s)")'" \[$WHITE\]$ \[$RESET\]"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
