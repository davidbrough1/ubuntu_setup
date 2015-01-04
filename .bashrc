# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    eval `/usr/bin/dircolors -b ~/.dircolors`
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
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


# # uncomment next line for debugging
# #set -x
# BLACK="\[\033[0;30m\]"
# BLUE="\[\033[0;34m\]"
# GREEN="\[\033[0;32m\]"
# CYAN="\[\033[0;36m\]"
# RED="\[\033[0;31m\]"
# PURPLE="\[\033[0;35m\]"
# YELLOW="\[\033[0;33m\]"
# GREY="\[\033[0;37m\]"
# BLACKB="\[\033[1;30m\]"
# BLUEB="\[\033[1;34m\]"
# BROWN="\[\033[1;32m\]"
# CYANB="\[\033[1;36m\]"
# REDB="\[\033[1;31m\]"
# PURPLEB="\[\033[1;35m\]"
# BROWNB="\[\033[1;33m\]"
# GREYB="\[\033[1;37m\]"
# NONE="\[\033[0m\]"
# export EDITOR=vi
# export MOZ_PRINTER_NAME=740p
# unset MAIL

# # If this is a non-interactive shell, we still want to get
# # the stuff (like $PATH) in /etc/profile if we haven't already
# if [[ -z "$Environ_Sourced" && -f /etc/profile ]]
# then
#     source /etc/profile
# fi

if [ "$PS1" ]
then
    if [ -f ~/.bash_aliases ]
    then
    source ~/.bash_aliases
    fi

    # Turn on automatic directory spelling correction (for 'cd'),
    # checking for removed commands, and saving multi-line commands
    # on one line in the history
    shopt -s cdspell checkhash cmdhist

    # Turn off HUP on exit, mail notification, and using $PATH for
    # the 'source' command
    shopt -u huponexit mailwarn sourcepath

    function prompt_command
    {
    if [ "$?" = 0 ]
    then
        ERRPROMPT=""
    else
        ERRPROMPT="($?)"
    fi
    }
    PROMPT_COMMAND=prompt_command
    # Put current user@machine:/directory on headline of xterms
    # case $TERM in
    #     iris-ansi*|*xterm*)
    #       PS="${RED}\${ERRPROMPT}${BLUE}\!"
    #       if [ $UID = $EUID -a $UID -ne 0 ]
    #       then
    #       PS="${PS} ${BROWN}\h${BLUE}% ${NONE}"
    #       else
    #       PS="${PS} ${RED}\u@\h${BLUE}# ${NONE}"
    #       fi
    #       PS1="${PS}\[\e]2;\u@\h:\w\007\e]1;\u@\h\007\]"
    #         ;;
    #   default)
    #       if [ $UID = $EUID -a $UID -ne 0 ]
    #       then
    #       PS1="\${ERRPROMPT}\! \h$% "
    #       else
    #       PS1="\${ERRPROMPT}\! \u@\h$#"
    #       fi
    # esac
    PS1="[\\d \\t \\u@\\h:\\w]$ "
    PS1="\[\e[1;32m\]${PS1}\[\e[m\]"

    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        ;;
    *)
        ;;
    esac

fi

export PATH=$HOME/bin:${PATH}

source ~/.git-completion.bash

# added by Anaconda 2.1.0 installer
export PATH="/home/david/anaconda/bin:$PATH"
export PATH=$HOME/local/bin:$PATH



alias ipynb='ipython notebook'












