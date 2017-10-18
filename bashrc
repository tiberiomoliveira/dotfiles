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

# If necessary you can change this to the location of git-prompt.sh on your distribution.
source ~/.bash/git-prompt.sh
 
# Creates the bash_prompt function
bash_prompt () {
 
# Checks to see if the current directory is a git repo or not
gitcheck_branch="$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "yes"; else echo "no"; fi)"
 
if [ $gitcheck_branch == "yes" ];
then
        # If we are in a git repo, then check to see if there are uncommitted files
        gitcheck_status="$(git status | grep "nothing to commit" > /dev/null 2>&1; if [ $? -eq 0 ]; then echo "clean"; else echo "unclean"; fi)"
 
    if [ $gitcheck_status == "clean" ];
    then
        # If there are no uncommitted files, then set the color of the git branch name to green
        git_prompt='\[\033[0;32m\]$(__git_ps1)'
    else
        # If there are uncommitted files, set it to red.
        git_prompt='\[\033[0;31m\]$(__git_ps1)'
    fi
else
    # If we're not in a git repo, then display nothing
    git_prompt=""
fi
 
# This is what actually sets our PS1. The ${git prompt} is what will display our git status.
PS1="\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)${git_prompt} \n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[0;32m\]$\"; else echo \"\[\033[0;31m\]$\"; fi)\[\033[00m\] "
 
}
# PROMPT_COMMAND is run just before the PS1 is printed. We've set it to run our bash_prompt function.
PROMPT_COMMAND=bash_prompt
