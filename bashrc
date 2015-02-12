# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# history settings
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ls='ls -G'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

alias clear-cache='dscacheutil -flushcache'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

