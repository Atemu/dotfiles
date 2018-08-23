#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#set vim as default editor
export EDITOR=vim

#fix java program rendering and enable text AA
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
