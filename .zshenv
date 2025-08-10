if [ -x /opt/homebrew/bin/brew ]; then
    #echo 'brew executable: /opt/homebrew/bin/brew'
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi
if [ -d ${HOME}/.local/bin ]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi
if [ -d "${HOME}/Library/Python" ]; then
    while IFS= read -r dir
    do
        PATH="${dir}:${PATH}"
    done < <(find "${HOME}/Library/Python" -type d -name bin 2> /dev/null | sort -Vr)
fi
## HOMEBREW_PREFIX=/opt/homebrew
## HOMEBREW_CELLAR=/opt/homebrew/Cellar
## HOMEBREW_REPOSITORY=/opt/homebrew
## HOMEBREW_SHELLENV_PREFIX=/opt/homebrew
#
# 'brew shellenv' sets PATH environment variable, but 'path_helper -s' in '/etc/zprofile' overrides this.

# eval "$(/opt/homebrew/bin/brew shellenv)"
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"
export LD_LIBRARY_PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib:${LD_LIBRARY_PATH}"
# Do not set TERM environment variable in dotfiles.
# This variable is supposed to be set by terminal emulator (Terminal.app, iTerm.app, etc.)
# https://paulgessinger.com/posts/2020/full-gui-colors-in-iterm-tmux-and-vim/
# export TERM='xterm-256color'
