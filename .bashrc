#bg: #08141E              #fg: #F8FA90                  #font: DejaVu Sans Mono 8

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi

HISTCONTROL=ignoredups              # don't put duplicate lines
HISTSIZE=1000
HISTFILESIZE=2000

stty -ixon                          # Disable ctrl-s and ctrl-q.
shopt -s autocd                     # Allows you to cd into directory merely by typing the directory name.
shopt -s cdspell                    # autocorrects cd misspellings
shopt -s checkwinsize               # update the value of LINES and COLUMNS after each command if altered
shopt -s histappend                 # append to the history file, don't overwrite it

[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_DESCRIBE_STYLE=default

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

__prompt_command() {
  local EXIT="$?"
  local KHAKI='\001\e[38;2;195;163;138m\002'
  local BOLD='\[\e[1m\]'
  local RESET='\[\e[0m\]'
  local EXIT_CODE=''

  if [ $EXIT != 0 ]; then
    EXIT_CODE='\[\e[0;31m\]' # Add red if exit code non 0
  fi

  PS1=""
  __git_ps1 "${KHAKI}" "${BOLD}\u@\W ${EXIT_CODE}⬥${RESET} " "%s "

  [[ ${__new_wd:=$PWD} != $PWD ]] && ls -AF; __new_wd=$PWD # Calls `l` when changing directory
}

PROMPT_COMMAND=__prompt_command

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|*-kitty) color_prompt=yes;;
esac

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -AF'

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc
# and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export VISUAL=vim

alias v=nvim
alias g='git'
[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git
__git_complete g _git
[ -f ~/Documents/private/.alias ] && source ~/Documents/private/.alias

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
