if [ -f $HOME/dotfiles/globalrc ]; then
   source $HOME/dotfiles/globalrc
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

export MYVIM=plugins  # only pull pure vimscript plugins

# prompt
PS1='[\u@\h \W]\$ '
BROWSER=/usr/bin/xdg-open
