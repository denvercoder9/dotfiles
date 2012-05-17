#
# aliases
#

alias ls='ls --color=always' # ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lA'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias less='less -rM'
alias update='sudo apt-get update && sudo apt-get upgrade'

#
# inputrc stuff
#
# TODO This will give an error when scp'ing for example
# Put in .inputrc or .bash_profile probably...

case "$-" in 
*i*)
    bind TAB:menu-complete
    bind 'set match-hidden-files off'
    bind 'set show-all-if-ambiguous on'
    bind 'set visible-stats on'
esac

#
# functions
#

pg() {
    (ps aux | head -n 1) && (ps aux | grep $1)
}

color() {
    grep -E "$1|" --color=always $2
}

lat() {
    if [[ -z $1 ]]; then
        NO=10
    else
        NO=$1
    fi
    ls -lt | tail -n +2 | head -n $NO
}

parse-git-branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function myprompt {
    # Wrap everything not printable in \[ ... \] for 
    # readline to be able calculate to the corrent width
    PS1=$(parse-git-branch)
    # if root, color red
    if [ $UID -eq 0 ]; then
        PS1="\[\e[31m\]"
    fi
    # if we're in a SSH session, add host name
    if [[ -n $SSH_CONNECTION ]]; then
        PS1=$PS1"\h" 
    fi
    # show current working dir, # and reset color
    PS1=$PS1":\W#\[\e[0m\] "
}

#
# Conditional stuff 
#

# Only if in an X environment
if [[ -n $DISPLAY ]]; then
    setxkbmap se
    setxkbmap -option ctrl:nocaps
    xset -b # beep off
fi

if [ -e ~/.pythonstartup ]; then
    export PYTHONSTARTUP=~/.pythonstartup
fi

AUTOJUMP_PATH=/usr/share/autojump/autojump.sh
if [ -e $AUTOJUMP_PATH ]; then
    . $AUTOJUMP_PATH
fi

VIRTUALENV_PATH=/usr/local/bin/virtualenvwrapper.sh
if [ -e $VIRTUALENV_PATH ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    . $VIRTUALENV_PATH
fi

if [ -e $HOME/scripts ]; then
    export PATH=$PATH:$HOME/scripts
    export PYTHONPATH=$PYTHONPATH:$HOME/scripts
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#
# Exports (keep after function defintions)
#

PROMPT_COMMAND=myprompt
export HISTCONTROL=erasedups
export EDITOR=vim
