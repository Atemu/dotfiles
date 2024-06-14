#!/usr/bin/env bash
# ^ hey emacs, this is bash code
alias ls='ls --color'
alias l='ls -lAhv --time-style=long-iso'
alias ll='ls -lhv --time-style=long-iso'
alias la='ls -Ahv --time-style=long-iso'
alias lsblk='lsblk -o NAME,SIZE,LABEL,MOUNTPOINTS,MODEL,SERIAL'
alias 8601='date +%Y%m%dT%H%M%S'
alias 8601e='date +%Y-%m-%dT%H\:%M\:%S'
alias 8601u='echo $(8601 -u)Z'
alias 8601ue='echo $(8601e -u)Z'
alias cp='cp --reflink=auto'
alias cps='cp --sparse=auto'
alias sudo='sudo ' #pass aliases to sudo https://askubuntu.com/a/22043/863714
alias iomon='iostat --human 1 /dev/sd? /dev/mmcblk? /dev/vd? /dev/nvme?n?' #io monitoring command
alias please='sudo '
alias fucking='sudo '
alias ip='ip --color'
alias e='$EDITOR'
alias et='emacsclient -t'
alias ec='emacsclient'
alias ecc='emacsclient -c'
# TODO these should live in nixos-config
alias nixos-update='sudo git -C /nix/var/nix/nixos-config reset --hard $NIXOS_REF'
alias nixpkgs-update='sudo git -C /nix/var/nix/nixpkgs reset --hard $NIXPKGS_REF'
alias nixfiles-update='(
      pushd ~/Projects/nixfiles/ && \
      nixfiles-commit && \
      sudo git -C /nix/var/nix/nixfiles reset --hard master && \
      sudo sudo git -C /nix/var/nix/nixfiles submodule update ; \
      popd
      )'
alias nix-stray-roots='nix-store --gc --print-roots | grep -vE "^(/nix/var|/run/\w+-system|\{memory|\{censored|/proc/maps/)"'
alias np='cd ~/Projects/nixpkgs'
alias no='cd ~/Projects/nixos-config'
alias nf='cd ~/Projects/nixfiles'
alias ssh='.ssh_backoff' # My ssh wrapper that implements exponential back-off
alias nixgc="sudo nix-collect-garbage --delete-older-than 30d && nix-collect-garbage --delete-older-than 30d && nix store optimise"
