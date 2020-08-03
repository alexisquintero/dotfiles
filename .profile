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

export PATH="$HOME/.local/bin:$PATH"

# WSL
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

[ -f ~/.bashrc ] && source ~/.bashrc
