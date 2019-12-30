alias ls='ls --time-style=long-iso'
alias ll='ls -lhv --time-style=long-iso'
alias la='ls -lAhv --time-style=long-iso'
alias gd='rclone mount Google\ Drive: "$HOME"/Google\ Drive'
alias 8601='date +%Y%m%dT%H%M%S'
alias 8601e='date +%Y-%m-%dT%H\:%M\:%S'
alias 8601u='echo $(8601 -u)Z'
alias 8601ue='echo $(8601e -u)Z'
alias cpr='cp --reflink=auto'
alias sudo='sudo ' #pass aliases to sudo https://askubuntu.com/a/22043/863714
alias iomon='iostat --human 1 /dev/sd? /dev/mmcblk?' #io monitoring command
alias please='sudo '
alias fucking='sudo '
alias applyconfig='sudo git -C /etc/nixos/ fetch && sudo git -C /etc/nixos/ reset --hard origin/master'
