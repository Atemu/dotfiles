#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#load aliases from alias file:
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

#fix java program rendering and enable text AA
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

PS1='[\u@\h \W]\$ '

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#enable vi mode
set -o vi

#enable thefuck
[[ -f "$(which fuck)" ]] && eval $(thefuck --alias)
