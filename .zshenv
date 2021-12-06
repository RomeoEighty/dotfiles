export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export LD_LIBRARY_PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib:${LD_LIBRARY_PATH}"

# Do not set TERM environment variable in dotfiles.
# This variable is supposed to be set by terminal emulator (Terminal.app, iTerm.app, etc.)
# https://paulgessinger.com/posts/2020/full-gui-colors-in-iterm-tmux-and-vim/
# export TERM='xterm-256color'
