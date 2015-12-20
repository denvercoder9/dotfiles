# oh-my-zsh stuff
#
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git git-flow autojump)
source $ZSH/oh-my-zsh.sh

# my own stuff

alias .='source'
#alias ls='ls --color=always' # ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lA'
alias L='ls -l | less'
alias LL='ls -la | less'
alias lg='ls -l | grep'
alias llg='ls -la | grep'
alias mv='mv -i'
alias cp='cp -i'
#alias rm='rm -I'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
#alias less='less -rM'
alias less='less -R'
alias mplayer='mplayer -really-quiet'
alias no='yes n'
alias svi='sudo -E vi'
alias grep='grep --color'

alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# git stuff

alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'

alias gco-='git checkout -'
alias gcd='git checkout develop'
alias gdi='git diff'
alias glp='git log --patch'

pg() {
    (ps aux | head -n 1) && (ps aux | grep -i $1)
}

color() {
    grep -E "$1|" --color=always $2
}

lat() {
    if [[ -z $1 ]]; then NO=10
    else NO=$1 fi
    ls -lt | tail -n +2 | head -n $NO
}

# TODO
# if [[ $IS_MAC -eq 1 ]]; then

# Only if in an X environment
if [[ $(uname) != "Darwin" && -n $DISPLAY ]]; then
    setxkbmap se
    setxkbmap -option ctrl:nocaps
    xset -b # beep off
fi

if [[ $(uname) == 'Darwin' ]]; then
    export CLICOLOR_FORCE=1
    alias ls='ls -G'
fi

if [[ $(uname) == 'Darwin' ]]; then
    alias text='open -a textedit'
fi

if [ -e ~/.pythonstartup ]; then
    export PYTHONSTARTUP=~/.pythonstartup
fi

# LINUX
AUTOJUMP_PATH=/usr/share/autojump/autojump.sh
if [ -e $AUTOJUMP_PATH ]; then
    . $AUTOJUMP_PATH
else
    AUTOJUMP_PATH=/usr/local/etc/autojump.sh
    if [ -e $AUTOJUMP_PATH ]; then
        . $AUTOJUMP_PATH
    fi
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

unsetopt beep notify

bindkey \^W backward-kill-word
bindkey \^U backward-kill-line

#DISABLE_AUTO_UPDATE='true'
#CASE_SENSITIVE="true"

#setopt autocd
#setopt extendedglob

#setopt appendhistory autocd extendedglob nomatch
setopt no_share_history
setopt hist_find_no_dups

# treat jobs like bash do
setopt no_hup
setopt no_check_jobs

# smarter completion
setopt nolistambiguous
setopt menu_complete
setopt no_case_glob

unsetopt correct_all

export EDITOR=vim
set -o emacs

zstyle ':completion:*:*:vi:*:*files' ignored-patterns '*.pyc'
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.pyc'

autoload zmv

setopt AUTO_PUSHD
alias o='popd'
#alias -s py=vim
alias pss='pss --nobinary'
alias psy='pss --py'
alias rdesktop="LC_ALL=sv_SE.UTF-8 rdesktop"
alias pyclean='find . -regex ".*\.pyc$" -print -delete'

if [ -e /usr/bin/md5sum ]; then
    alias md5='md5sum'
fi

if [ -e /usr/bin/colordiff ]; then
    alias diff=colordiff
fi

eval "$(pip completion --zsh)"

if [[ -e ~/.pythonstartup ]]; then
    export PYTHONSTARTUP=~/.pythonstartup
fi

PROJECTS=~/projekt
export PYTHONPATH=$PROJECTS/collins/checkout_api/libs:$PROJECTS/collins/checkout_api/
export PATH=$PATH:$PROJECTS/collins/checkout_api/bin:$HOME/scripts:$HOME/python/bin

alias py.test='python -Wignore -m py.test -s -l --tb=short --strict'

postjson() {
    curl -X POST $1 -H "Content-Type:application/json" -d $2
}
putjson() {
    curl -X PUT $1 -H "Content-Type:application/json" -d $2
}

alias python='python -Wignore'

alias pbp='pbpaste'
alias pjq='pbpaste | jq'
alias pbc='pbcopy'

export PATH=$PATH:$HOME/Library/Haskell/bin

flow-stat() {
    git --no-pager diff develop..HEAD --numstat | \
    awk '{ a+=$1; b+=$2 } END {print "Added:\t\t" a "\n" "Deleted:\t" b}'
}

statistics() {
    num_files=$(find . -type f -regex '.*\.py$' | wc -l)
    num_lines=$(find . -type f -regex '.*.py$' | xargs -I {} wc -l {} | awk '{ a+=$1 } END { print a }')
    echo "Files: $num_files"
    echo "Lines: $num_lines"
}

grepv() {
    cmd="grep -v $1"
    shift
    for arg in $@; do
        cmd="$cmd | grep -v $1"
        shift
    done
    eval $cmd
}

alias git='/usr/local/bin/git'

export LANG=en_US.UTF-8

alias listening-ports='lsof -i -P | grep "LISTEN"'

alias compile-ssh-config='rm ~/.ssh/config && cat ~/.ssh/*.conf >> ~/.ssh/config'

if [ -e ~/.env ]; then
    workon $(cat ~/.env)
fi

if [ -e ~/.tokens ]; then
    . ~/.tokens
fi

export PATH="$HOME/.rvm/bin:$HOME/.rvm/gems/ruby-2.2.0/bin":$PATH

alias sudo='sudo '  # If the last character of the alias value is a space or tab character,
                    # then the next command word following the alias is also checked for alias expansion.

# this is because
# rm foo 2>/dev/null works when foo is not present, but
# rm foo* 2>/dev/null 
# doesn't... 
setopt null_glob

alias textedit='open -a /Applications/TextEdit.app'

alias rabbitmqctl=/usr/local/Cellar/rabbitmq/3.5.2/sbin/rabbitmqctl

alias pip-upgrade-all='pip list --outdated | tail +1 | awk '"'"'{ system("pip install -U "$1) }'"'"''
# rlwrap for the win

alias redis-cli='rlwrap redis-cli'
alias racket='rlwrap racket'
alias lisp='rlwrap sbcl'
alias node="env NODE_NO_READLINE=1 rlwrap node"
alias clojure='(cd ~/Downloads/clojure-1.6.0; rlwrap java -cp clojure-1.6.0.jar clojure.main)'
