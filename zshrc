# oh-my-zsh stuff
#
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git git-flow autojump history-search-multi-word)
source $ZSH/oh-my-zsh.sh

# my own stuff

alias .='source'
#alias ls='ls --color=always' # ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lA'
alias L='ls -l | less'
alias LL='ls -la | less'
alias lg='ls -l | grep -i'
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
#alias mplayer='mplayer -really-quiet'
alias no='yes n'
alias svi='sudo -E vi'
alias grep='grep --color'

alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# git stuff

alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'

alias gl='git pull --stat'
alias gco-='git checkout -'
alias glp='git log --patch'
alias gpp='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

alias gss='git stash show'
alias gssp='git stash show -p'
alias gsd='git stash drop'
alias gsp='git stash pop'
alias gsl='git stash list'
alias gg='git --no-pager'
alias gcb='git rev-parse --abbrev-ref HEAD'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/bin:$HOME/code/python/bin

pg() {
    (ps aux | head -n 1) && (ps aux | grep -i $1)
}

color() {
    grep -E "$1|" --color=always $2
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

export VIRTUALENV_PATH=/usr/local/bin/virtualenvwrapper.sh
if [ -e $VIRTUALENV_PATH ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    . $VIRTUALENV_PATH
fi

bindkey \^V history-incremental-search-backward
bindkey \^W backward-kill-word
bindkey \^U backward-kill-line
# bindkey '^P' up-line-or-search      # make ^P behave exactly like arrow up
bindkey '^P' up-line-or-history

#DISABLE_AUTO_UPDATE='true'
#CASE_SENSITIVE="true"

#setopt autocd
#setopt extendedglob

#setopt appendhistory autocd extendedglob nomatch
setopt no_share_history
setopt hist_find_no_dups
setopt hist_ignore_space

# treat jobs like bash do
setopt no_hup
setopt no_check_jobs

# smarter completion
setopt nolistambiguous
setopt menu_complete
setopt no_case_glob

setopt auto_pushd

# this is because
# rm foo 2>/dev/null works when foo is not present, but
# rm foo* 2>/dev/null
# doesn't...
setopt null_glob

unsetopt correct_all
unsetopt beep notify

export EDITOR=vim
set -o emacs

zstyle ':completion:*:*:vi:*:*files' ignored-patterns '*.pyc'
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.pyc'

autoload zmv

alias o='popd'
alias rdesktop="LC_ALL=sv_SE.UTF-8 rdesktop"

if [ -e /usr/bin/md5sum ]; then
    alias md5='md5sum'
fi

if [ -e /usr/bin/colordiff ]; then
    alias diff=colordiff
fi

#eval "$(pip completion --zsh)"

if [[ -e ~/.pythonstartup ]]; then
    export PYTHONSTARTUP=~/.pythonstartup
fi

alias py.test='python -m py.test -s -l --tb=short --strict'

postjson() {
    curl -X POST $1 -H "Content-Type:application/json" -d $2
}
putjson() {
    curl -X PUT $1 -H "Content-Type:application/json" -d $2
}

alias pbp='pbpaste'
alias pjq='pbpaste | jq'
alias pbc='pbcopy'

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

export LANG=en_US.UTF-8

alias listening-ports='lsof -i -P | grep "LISTEN"'

alias compile-ssh-config='rm ~/.ssh/config && cat ~/.ssh/*.conf >> ~/.ssh/config'

alias sudo='sudo '  # If the last character of the alias value is a space or tab character,
                    # then the next command word following the alias is also checked for alias expansion.


alias textedit='open -a /Applications/TextEdit.app'

alias pip-upgrade-all='pip list --outdated | tail +1 | awk '"'"'{ system("pip install -U "$1) }'"'"''
# rlwrap for the win

alias redis-cli='rlwrap redis-cli'
alias racket='rlwrap racket'
alias lisp='rlwrap sbcl'
alias node="env NODE_NO_READLINE=1 rlwrap node"

alias wetter='curl http://wttr.in/Hamburg'

alias gitx='open -a /usr/local/Caskroom/rowanj-gitx/0.15.1964/GitX.app .'

lat() {
    if [[ -z $1 ]]; then NO=10
    else NO=$1 fi
    ls -lt | tail -n +2 | head -n $NO
}

# just for now...
alias startpostgres='/usr/local/bin/postmaster -D /usr/local/var/postgres &'

alias dirsizes='find . -type d -maxdepth 1 -exec sh -c "du -h {} | tail -n 1" \;'

alias deleteempty='find . -empty -print -delete'

dirwise() {
    for d in `find . -type d -maxdepth 1`; do
        (cd $d && pwd)
    done
}

export HOMEBREW_LOGS=/usr/local/var/log/

alias dir='\ls -d */'
alias lwcl='ls -l | wc -l'

alias reload='source ~/.zshrc'

tailf() {
    while ! tail -f $1 2>/dev/null; do sleep 1; done
}

alias -g G='| grep'
alias -g W='| wc -l'
alias -g E='| xargs -o vi'
alias -g J='| jq'
highlight() { grep --color -E "$1|$" }
alias -g HL='| highlight'
alias -g X='| xargs'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'

f() {
    find . -iname "*$1*" -print
}

fe() { find . -name $1 -print }

e() {
    pss "$1" -l | xargs -o vi
}

gi() {
    grep -ri $1 .
}

alias find='noglob find'
alias zmv='noglob zmv -W'
alias jq='noglob jq'
alias e='fzf --bind "v:execute(vim {})"'

BACKUP_PATH=$HOME/Dropbox/backup
alias backup='borg create -v --stats --progress $BACKUP_PATH::backup-{now:%Y-%m-%d} $HOME/Desktop/first\ Project $HOME/documents $HOME/Downloads $HOME/Music $HOME/Pictures $HOME/projekt $HOME/code $HOME/passwd.kdbx $HOME/.task'
alias backup-list='borg list $BACKUP_PATH'
alias backup-prune='borg prune --keep-last 1 $BACKUP_PATH'

alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
alias wifi-connect='networksetup -setairportnetwork en0'

split() {
    python -c "import sys, itertools as it; print '\n'.join(it.chain.from_iterable(line.split('$1') for line in sys.stdin.readlines()))"
}

new-mac() {
    mac=$(python -c "import random; data=hex(random.getrandbits(48))[2:-1]; print ':'.join(map(''.join, zip(*[iter(data.zfill(12))]*2)))")
    sudo ifconfig en0 ether $mac
}

wifi() {
    new-mac
    wifi-connect $1 $2
}

export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/bin:$HOME/code/python/bin

alias list-timezones='sudo systemsetup -listtimezones'

week() { python -c "from datetime import datetime; print(datetime.now().isocalendar()[1])" }

alias date-berlin='TZ=Europe/Berlin date'
alias date-ny='TZ=US/Eastern date'

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias https='http --default-scheme=https'
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# quick n dirty for swagger output
find-url() {
    jq '.paths | to_entries[] | select (.key == "$1") .value'
}

export VIRTUALENV_PYTHON=/usr/local/bin/python3

alias pip='pip --no-cache'
alias tree='tree -I __pycache__'
alias pyclean='find . -type d -name __pycache__ -exec rm -rf {} \;'
alias psql=/Applications/Postgres.app/Contents/Versions/9.4/bin/psql
alias my-ip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
