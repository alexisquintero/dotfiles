#bg: #08141E              #fg: #F8FA90                  #font: DejaVu Sans Mono 8

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups
HISTSIZE=1000
HISTFILESIZE=2000

stty -ixon                          # Disable ctrl-s and ctrl-q.
shopt -s autocd                     # Allows you to cd into directory merely by typing the directory name.
shopt -s cdspell                    # autocorrects cd misspellings
shopt -s checkwinsize               # update the value of LINES and COLUMNS after each command if altered
shopt -s histappend                 # append to the history file, don't overwrite it

PROMPT_COMMAND='[[ ${__new_wd:=$PWD} != $PWD ]] && la; __new_wd=$PWD'   # Calls `la` when changing directory

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|*-kitty) color_prompt=yes;;
esac

. ~/.config/utils/PS1.sh

if [ "$color_prompt" = yes ]; then
  if [[ "$TERM" =~ 256color ]] || [[ "$TERM" =~ kitty ]]; then
    PS1="${KHAKI}${BOLD}\u@\W${BOLD} \$(insideGit) ${RESET}"
  else
    PS1="${LYELLOW}${BOLD}\u@\W${BOLD} \$(insideGit) ${RESET}"
  fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc
# and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export VISUAL=vim EDITOR=vim

alias v='nvim'
alias g='git'
source /usr/share/bash-completion/completions/git
__git_complete g _git
alias r='ranger'
alias cdc='cd ~/Documents/Ib5k/code/'
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

. ~/.config/utils/ssh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
