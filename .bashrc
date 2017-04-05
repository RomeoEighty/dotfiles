# #------------------
# # general command
# #------------------
# alias cd..='cd ..'
# alias cd...='cd ../..'
# alias cd....='cd ../../..'
# alias desktop='cd ~/Desktop/'
# alias ls='ls -G'
# alias ll='ls -alG'
# alias rm='rmtrash'
# alias mv='mv -i'
# alias vi='vim'
# #alias ls -G='ls'
# #vim /etc/sudoersは無効化すべき
# 
# #------------------
# # RoboTech
# #------------------
# if [[ "$(uname)" == 'Darwin' ]]; then
#     alias serialload='sudo kextload /System/Library/Extensions/AppleUSBFTDI.kext'
#     alias serialunload='sudo kextunload /System/Library/Extensions/AppleUSBFTDI.kext'
# fi
# 
# #------------------
# # private aliases
# #------------------
# alias gcc='gcc -W -Wall'
# alias g++='g++ -std=c++11 -Wall -Wextra -Wconversion'
# alias showover1gb='sudo du -g -x -d 5 / | awk '\''$1 >= 5{print}'\'''
# alias soall='source ~/.bash_profile; source ~/.bashrc'
# alias vivimrc='vim ~/.vimrc'
# alias vihist='vim ~/.bash_history'
# if [[ "$(uname)" == 'Darwin' ]]; then
#     alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
#     alias brsetup='brew update && brew upgrade && brew cask update && brew doctor | terminal-notifier -message'
#     alias brcleanup='brew cleanup -n; sudo brew cleanup; brew cask cleanup; brew doctor'
#     alias brlist='brew list; printf "\n\n"; brew cask list'
#     alias watch='watch '
# fi

# default macOS terminal (Bash 3.2) does not support "\e"
red='\[\033[1;31m\]'
green='\[\033[0;32m\]'
blue='\[\033[1;34m\]'
light_grey='\[\033[1;37m\]'
dark_grey='\[\033[1;90m\]'
GREEN='\[\033[0;92m\]'
color_reset='\[\033[0'

# function SHOW_STATUS() {
#     if $1; then
#         echo "\[\e[4;40;31m\]\$1\[\e[0m\]"
#     else
#         echo "\[\e[4;40;32m\]\$1\[\e[0m\]"
#     fi
# }
if [ $(id -u) -eq 0 ];
then
    export PS1="\n${dark_grey}\# \033[0m\e[5;40;91m\] \u ${color_reset}${green} [\[\033[38;5;88m\]$(uname -sr)${green}] \[\033[38;5;68m\]\w\033[m\n\t \[\033[4;40;32m\]\$?\[\033[0m\] \[\033[38;5;22m\]$ \[\033[0m\]"
else
    export PS1="\n${dark_grey}\#${green} \u [\[\033[38;5;88m\]$(uname -sr)${green}] \[\033[38;5;68m\]\w\033[m\n\t \[\033[4;40;32m\]\$?\[\033[0m\] \[\033[38;5;22m\]$ \[\033[0m\]"
fi
# ------------------
# bash
# ------------------
alias vibrc='vim ~/.bashrc; echo -en "\nrebooting bash...\n"; exec bash -l'
alias vibprofile='vim ~/.bash_profile; echo -en "\nrebooting bash...\n"; exec bash -l'
alias vihist='vim ~/.bash_history'
alias viinputrc='vim ~/.inputrc; bind -f ~/.inputrc && echo -en "bind -f ~/.inputrc"'
alias vizenv='vim ~/.zshenv'
alias vizrc='vim ~/.zshrc'
