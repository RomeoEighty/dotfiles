export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export TERM=xterm-256color

export PATH="${HOME}/.rbenv/bin:${PATH}"

export LIBRARY_PATH="/usr/local/lib:${LIBRARY_PATH}"
export LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"
export CPATH="/usr/local/include:${CPATH}"

if builtin command -v rbenv > /dev/null ; then
    eval "$(rbenv init -)"
fi

if builtin command -v opem > /dev/null ; then
    eval "$(opam config env)"
fi


# -------------------------------------------------------
# histroy configuration
# -------------------------------------------------------
function share_history {        # append multiple sessions history simultaniously
    history -a                  # append history lines from this session to the history file
    history -c                  # clear the history list by deleting all of the entries
    history -r                  # read the history file and append the contents to the history list
}
PROMPT_COMMAND='share_history'  # execute function
shopt -u histappend             # disable appending history (function above done automatically)
HISTSIZE=10000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth          # ignoreboth = ignorespace+ignoredups

HISTTIMEFORMAT=`echo -e "\033[38;5;28m%d/%m/%y %T\033[0m "`
HISTIGNORE="history*::pwd*:exit:alias:ll:fg:ls"
# =======================================================


# git tab completion (homebrew)
if builtin command -v brew > /dev/null ; then
    if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
        . `brew --prefix`/etc/bash_completion.d/git-completion.bash
        echo -en "Source $(brew --prefix)/etc/bash_completion.d/git-completion.bash\n"
    fi

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
        echo -en "Source $(brew --prefix)/etc/bash_completion\n"
    fi

    export HOMEBREW_INSTALL_CLEANUP=1
fi

# private values
if [ "$(uname)" == 'Darwin' ]; then
    if [[ -f $(dirname $(readlink ${HOME}/.bash_profile))/private/privateval ]] ; then
        . $(dirname $(readlink ${HOME}/.bash_profile))/private/privateval
    fi
else
    if [[ -f $(dirname $(readlink -f ${HOME}/.bash_profile))/private/privateval ]] ; then
        . $(dirname $(readlink ${HOME}/.bash_profile))/private/privateval
    fi
fi

if [[ -f ~/.aliases ]] ; then
    . ~/.aliases
    echo "Source ~/.aliases"
fi
if [[ -f ~/.bashrc ]] ; then
    . ~/.bashrc
    echo "Source ~/.bashrc"
fi

if builtin command -v who > /dev/null ; then
    who -H
fi

echo -en '\n'
echo -en '[Current terminal]:\n\t'
who am I
echo -en '\n'
echo -en '[Bash Version]:\n\t'
echo $BASH_VERSION
echo -en '\n'
