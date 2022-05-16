#Set freedesktop dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PATH=$HOME/.local/bin/:$PATH

export EDITOR="emacsclient -t"
export SUDO_EDITOR=$EDITOR

#libvirt connect to system by default
export LIBVIRT_DEFAULT_URI="qemu:///system"

# needed for user channels to appear in NIX_PATH on non-NixOS Nix installations
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# Used by {nixos,nixpkgs}-update aliases
export NIXOS_REF=master
export NIXPKGS_REF=master
