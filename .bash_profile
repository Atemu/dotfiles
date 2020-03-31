#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Set freedesktop dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR=emacsclient
export SUDO_EDITOR=$EDITOR

#set GPG config home
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

#libvirt connect to system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Set default remote and branch for nixos-config
export NIXOS_CONFIG_REMOTE=origin
export NIXOS_CONFIG_BRANCH=master
