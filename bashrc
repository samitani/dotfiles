# prevent screen locks
stty stop undef

function myssh {
    # bogus auto complete
    DEST=`grep $1 ~/.ssh/known_hosts | head -n1 | awk '{ print $1 }' | awk -F, '{ print $1 }'`

    # no match
    if [ a$DEST = 'a' ]; then
        DEST=$1;
    fi

    TITLE=`echo $1 | awk -F'.' '{ print \$1 }'`;
    screen -t $TITLE ssh -o 'StrictHostKeyChecking=no' -o 'ForwardAgent=yes' $DEST
}

function realpath {
    local PARENT_DIR=$(dirname "$1")
    cd "$PARENT_DIR"
    local ABS_PATH="$(pwd)"/"$(basename $1)"
    cd - >/dev/null
    echo $ABS_PATH
}

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups 
export HISTFILE=$HOME/.bash_history 

export EDITOR=vim
export PAGER=less

# disabled GNU screen lock
export LOCKPRG='/bin/true'

# set term title with screen
export PROMPT_COMMAND='echo -ne "\033P\033]0;$(hostname)\007\033\\"'

alias gcc='gcc -Wall -g'
alias rm='rm -i'
alias mv='mv -i'
alias df='df -h'
alias scppath='echo -n `hostname`:; realpath'

# Fix SSH auth socket location so agent forwarding works within tmux/screen
if [ "$SSH_AUTH_SOCK" -a ! -e "$HOME/.ssh/agent.sock" ]; then
  ln -sf $SSH_AUTH_SOCK ~/.ssh/agent.sock
fi
