export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export TERM=xterm-256color

export PATH="$HOME/.rbenv/bin:$PATH"

export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export CPATH="/usr/local/include:$CPATH"

if builtin command -v rbenv > /dev/null ; then
    eval "$(rbenv init -)"
fi

if builtin command -v opem > /dev/null ; then
    eval "$(opam config env)"
fi

# private values
if [ "$(uname)" = 'Darwin' ]; then
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
if [[ -f ~/.zshrc ]] ; then
    . ~/.zshrc
    echo "Source ~/.zshrc"
fi

if builtin command -v who > /dev/null ; then
    who -H
fi

echo -en '\n'
echo -en '[Current terminal]:\n\t'
who am I
echo -en '\n'
echo -en '[Zsh Version]:\n\t'
echo $ZSH_VERSION
echo -en '\n'
# if [ "$(uname)" == 'Darwin' ]; then
#     say --voice=samantha --rate=320 --audio-device=Built-in "Hello sir!"
# fi
