# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

branchStatus () {
  MAINCHAR="❱"
  MAINBEHINDCHAR="❰"
  CURRENTCHAR="❱"
  CURRENTBEHINDCHAR="❰"
  DETACHEDCHAR="⥈"

  EDITEDFILESCOLOR="\e[32m"
  DETACHEDCOLOR="\e[91m"

  CURRENT=$(git symbolic-ref --short -q HEAD)

  OUTPUT=""
  #Check if detached
  if [[ $CURRENT == fatal* ]]
  then
    OUTPUT+="$DETACHEDCOLOR$DETACHEDCHAR"
    echo -e $OUTPUT
    #END FUNCTION
    return
  fi

  REMOTE=$(git remote)
  MAINBRANCH="master"
  UPSTREAMMAIN="$REMOTE/$MAINBRANCH"
  CURRENTUPSTREAM="$REMOTE/$CURRENT"

  RPMAINBRANCH=$(git rev-parse $MAINBRANCH)
  RPUPSTREAMMAIN=$(git rev-parse $UPSTREAMMAIN)
  RPCURRENT=$(git rev-parse $CURRENT)
  RPCURRENTUPSTREAM=$(git rev-parse $CURRENTUPSTREAM)

  #Check if there are edited files
  if [[ ! -z $(git status -s) ]]
  then
    OUTPUT+="$EDITEDFILESCOLOR"
  fi
  #Check if current is up to date
  if [ $RPCURRENT = $RPCURRENTUPSTREAM ]
  then
    OUTPUT+="$CURRENTCHAR"
  else
    OUTPUT+="$CURRENTBEHINDCHAR"
  fi
  #Check current != main
  if [ $CURRENT = $MAINBRANCH ]
  then
    echo -e $OUTPUT
    return
  fi
  #Check if main is up to date
  if [ $RPMAINBRANCH = $RPUPSTREAMMAIN ]
  then
    OUTPUT+="$MAINCHAR"
  else
    OUTPUT+="$MAINBEHINDCHAR"
  fi
  echo -e $OUTPUT
}

insideGit () {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    #echo "inside git repo"
    echo $(branchStatus)
  else
    echo '❱'
  fi
}

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[1m\e[93m\]\u@\[\e[0m\e[93m\]\W \[\e[1m\]$(insideGit) \[\e[0m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
VISUAL=nvim
export VISUAL EDITOR=nvim
export EDITOR

alias v='nvim'
alias g='git'
alias r='ranger'
source /usr/share/bash-completion/completions/git
__git_complete g _git

alias mute='amixer -D pulse set Master 1+ toggle'
alias master50='amixer set Master 75%'
alias muteSpeaker='amixer set Front 0%'
alias muteHeadphones='amixer set Headphone 0%'
alias hup='amixer set Headphone 10%+'
alias hdw='amixer set Headphone 10%-'
alias sup='amixer set Front 10%+'
alias sdw='amixer set Front 10%-'
alias headphone='amixer set Headphone playback 50% unmute'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
