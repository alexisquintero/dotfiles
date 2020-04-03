export GPG_TTY=$(tty)
export VISUAL=vim
export EDITOR=vim
export INPUTRC="$HOME/.config/readline/inputrc"
export LESSHISTFILE=-
export HISTFILE="$HOME/.config/bash/history"
export ICEAUTHORITY="$HOME/.cache/ICEauthority"

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.bashrc ] && source ~/.bashrc
