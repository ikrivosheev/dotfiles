# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTFILE="$XDG_CACHE_HOME/bash_history"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ -e "$HOME/.colors" ]
then
	source "$HOME/.colors"
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debiani_chroot)}\[$BGreen\]\u\[$Red\]@\[$BGreen\]\h\[$Color_Off\][\[$BIBlue\]\W\[$Color_Off\]]\[$BBlue\]$\[$Color_Off\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'

# ssh aliases
alias ssh='TERM=xterm-256color ssh'

# sudo aliases
alias sudo='sudo -H -E'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

command_exists () {
    type "$1" &> /dev/null ;
}

export PYTHON3_HOST_PROG="$HOME/.pyenv/versions/neovim3/bin/python"

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

alias xclip-copy="xclip -selection clipboard"
alias wget="wget --hsts-file $XDG_CONFIG_HOME/wget/hsts"

export EDITOR="$(which nvim)" || "$(which vim)"
export VISUAL="$(which nvim)" || "$(which vim)"
export PAGER="$(which less)"
export VIEWER="$(which less)"

# less history
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"

# python
# export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"

# gdb
export GDBHISTFILE="$XDG_CACHE_HOME/gdb_history"
alias gdb='gdb -nh -x "$XDG_CONFIG_HOME/gdb/init"'

# completion 
for file in "$XDG_DATA_HOME/bash-completion/completions/"* ; do
    if [ -f "$file" ]
    then
        source "$file"
    fi
done


# Postgresql env
export PSQL_HISTORY="$XDG_CACHE_HOME/psql_history"

# GPG
export GPG_TTY=$(tty)

