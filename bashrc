# uncomment next line for debugging
#set -x
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
GREY="\[\033[0;37m\]"
BLACKB="\[\033[1;30m\]"
BLUEB="\[\033[1;34m\]"
BROWN="\[\033[1;32m\]"
CYANB="\[\033[1;36m\]"
REDB="\[\033[1;31m\]"
PURPLEB="\[\033[1;35m\]"
BROWNB="\[\033[1;33m\]"
GREYB="\[\033[1;37m\]"
NONE="\[\033[0m\]"
export EDITOR=vi
export MOZ_PRINTER_NAME=740p
unset MAIL

# If this is a non-interactive shell, we still want to get
# the stuff (like $PATH) in /etc/profile if we haven't already
if [[ -z "$Environ_Sourced" && -f /etc/profile ]]
then
	source /etc/profile
fi

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
    # 	    PS="${RED}\${ERRPROMPT}${BLUE}\!"
    # 	    if [ $UID = $EUID -a $UID -ne 0 ]
    # 	    then
    # 		PS="${PS} ${BROWN}\h${BLUE}% ${NONE}"
    # 	    else
    # 		PS="${PS} ${RED}\u@\h${BLUE}# ${NONE}"
    # 	    fi
    # 	    PS1="${PS}\[\e]2;\u@\h:\w\007\e]1;\u@\h\007\]"
    #         ;;
    # 	default)
    # 	    if [ $UID = $EUID -a $UID -ne 0 ]
    # 	    then
    # 		PS1="\${ERRPROMPT}\! \h$% "
    # 	    else
    # 		PS1="\${ERRPROMPT}\! \u@\h$#"
    # 	    fi
    # esac
    eval `dircolors -b`
    alias ls='ls --color=auto'
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

# added by Anaconda 1.9.2 installer
export PATH="/home/dbb1/anaconda/bin:$PATH"
