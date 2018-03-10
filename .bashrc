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
