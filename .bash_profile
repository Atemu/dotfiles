#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Set freedesktop dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

#set vim as default editor
export EDITOR=vim

#fix java program rendering and enable text AA
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

#set GPG config home
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

#enable touch scrollin in FF
export MOZ_USE_XINPUT2=1

#libvirt connect to system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"
