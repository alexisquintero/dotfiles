export GPG_TTY=$(tty)
export VISUAL=vim
export EDITOR=vim
export INPUTRC="$HOME/.config/readline/inputrc"
export LESSHISTFILE=-
export HISTFILE="$HOME/.config/bash/history"
export ICEAUTHORITY="$HOME/.cache/ICEauthority"
export ANDROID_SDK_HOME="$HOME/.config/android"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
export PYLINTHOME="$HOME/.config/pylint"
export NVM_DIR="$HOME/.config/.nvm"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.bashrc ] && source ~/.bashrc
