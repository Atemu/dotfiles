export PROFILE_SOURCED=1

#Set freedesktop dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH=$HOME/.local/bin/:$PATH

export EDITOR="emacsclient -t"
export SUDO_EDITOR=$EDITOR

#libvirt connect to system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Used by {nixos,nixpkgs}-update aliases
export NIXOS_REF=master
export NIXPKGS_REF=master
