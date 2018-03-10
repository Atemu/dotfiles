#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#load aliases from alias file:
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
PS1='[\u@\h \W]\$ '
