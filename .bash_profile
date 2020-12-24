#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Set freedesktop dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH=$HOME/bin/:$PATH

export EDITOR=emacsclient
export SUDO_EDITOR=$EDITOR

#set GPG config home
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

#libvirt connect to system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# needed for user channels to appear in NIX_PATH on non-NixOS Nix installations
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# Set default remote and branch for nixos-config
export NIXOS_CONFIG_REMOTE=origin
export NIXOS_CONFIG_BRANCH=master

export NIXPKGS_REF=master
