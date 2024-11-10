#
# ~/.bashrc
#

# Copied from Nix-generated /etc/bashrc
# Needs to happen *before* the interactivity check
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source the profile if it wasn't already
[[ ! $PROFILE_SOURCED ]] && source ~/.profile

#load aliases from alias file:
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

PS1='[\u@\h \W]\$ '

# 8601 with a TAB at the end
HISTTIMEFORMAT='%Y-%m-%dT%H:%M:%S'$'\t'
# Unlimited history size
HISTFILESIZE=-1
HISTSIZE=-1
# "If the list of values includes  ignorespace,  lines which begin with a space
# character are not saved in the history list. A value of ignoredups causes lines
# matching the previous history entry to not be saved."
HISTCONTROL=ignorespace,ignoredups
# append to history, don't overwrite it
shopt -s histappend
# attempt to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# save multi-line commands to the history with embedded newlines
shopt -s lithist

# enable bash completion in interactive shells
if ! shopt -oq posix; then
    PROFILE_BASH_COMPLETIONS=$(for profile in $NIX_PROFILES ; do echo "$profile"/share/bash-completion/bash_completion ; done)

    for i in /usr/share/bash-completion/bash_completion /etc/bash_completion $PROFILE_BASH_COMPLETIONS ; do
        if [ -e "$i" ] ; then
            . "$i"
        fi
    done
fi

#enable vi mode
set -o vi

if type -p complete_alias > /dev/null; then
    source $(type -p complete_alias)

    aliases=(
        sc
        ssc
        scu
        dfh
    )

    for c in "${aliases[@]}" ; do
        complete -F _complete_alias $c
    done
fi
