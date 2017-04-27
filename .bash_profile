# -------------------------------------------------------
# color variables
# -------------------------------------------------------
# default macOS terminal (Bash 3.2) does not support "\e"
red='\[\033[1;31m\]'
green='\[\033[0;32m\]'
blue='\[\033[1;34m\]'
light_grey='\[\033[1;37m\]'
dark_grey='\[\033[1;90m\]'
GREEN='\[\033[0;92m\]'
color_reset='\[\033[0'


# -------------------------------------------------------
# prompt color
# -------------------------------------------------------
if [ $(id -u) -eq 0 ];
then
    export PS1="\n${dark_grey}\# \033[0m\e[5;40;91m\] \u ${color_reset}${green} [\[\033[38;5;88m\]$(uname -sr)${green}] \[\033[38;5;68m\]\w\033[m\n\t \[\033[4;40;32m\]\$?\[\033[0m\] \[\033[38;5;22m\]$ \[\033[0m\]"
else
    export PS1="\n${dark_grey}\#${green} \u [\[\033[38;5;88m\]$(uname -sr)${green}] \[\033[38;5;68m\]\w\033[m\n\t \[\033[4;40;32m\]\$?\[\033[0m\] \[\033[38;5;22m\]$ \[\033[0m\]"
fi

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export TERM=xterm-256color
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.robotech/bin:$HOME/bin"

export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export CPATH="/usr/local/include:$CPATH"

eval "$(rbenv init -)"


# -------------------------------------------------------
# histroy option
# -------------------------------------------------------
function share_history {        # append multiple sessions history simultaniously
        history -a              # append history lines from this session to the history file
        history -c              # clear the history list by deleting all of the entries
        history -r              # read the history file and append the contents to the history list
}
PROMPT_COMMAND='share_history'  # execute function
shopt -u histappend             # disable appending history (function above done automatically)
HISTSIZE=10000
HISTFILESIZE=50000
HISTCONTROL=ignoreboth          # ignoreboth = ignorespace+ignoredups

HISTTIMEFORMAT=`echo -e "\033[38;5;28m%d/%m/%y %T\033[0m "`
HISTIGNORE="history*::pwd*:exit:alias:ll:fg:ls"


# git tab completion (homebrew)
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
    echo -en "Source $(brew --prefix)/etc/bash_completion.d/git-completion.bash\n"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    echo -en "Source $(brew --prefix)/etc/bash_completion\n"
fi

if [[ -f ~/.aliases ]] ; then
    . ~/.aliases
    echo -en "Source ~/.aliases\n"
fi
if [[ -f ~/.bashrc ]] ; then
    . ~/.bashrc
    echo -en "Source ~/.bashrc\n"
fi

echo -en '\n'

if [ -x "`which who`" ]; then
    who -H
fi
# if [ -x "`which w`" ]; then
#     w
# fi
echo -en '\n'
echo -en '[Current terminal]:\n\t'
who am I
echo -en '\n'
echo -en '[Bash Version]:\n\t'
echo $BASH_VERSION
echo -en '\n'
if [ -x "`which fortune`" ]; then
    fortune
fi
# if [ "$(uname)" == 'Darwin' ]; then
#     say --voice=samantha --rate=320 --audio-device=Built-in "Hello sir!"
# fi

# echo -en '\n'
# 
# echo -en '                                        _.\n'
# echo -en '                                    _/=\\:<\n'
# echo -en '                                  .#/*let}\n'
# echo -en '                                //as\\@#:~/\n'
# echo -en '                               try()|:-./\n'
# echo -en '                              *~let:>@{#\n'
# echo -en '                              </>}#@~*/\n'
# echo -en '                             (+!:~/+/\n'
# echo -en '                             /={+|\n'
# echo -en '                 _.:+*as=             _.]@~let[.\n'
# echo -en '              .*()/if{@[[-#>\\=.__.<>/#{*+/@*/for=*~.\n'
# echo -en '            /-(#]:.(var/@~as/@</>\\]=/<if[/*:/<try@\\~\n'
# echo -en '           [:/@#</>}#for=\\>.<:try#>=\\*:/[(var<<.+_:#(=.\n'
# echo -en '         #do()=*:.>as//@[]-./[#=+)\\(var/@<>[]:-##~/*>\n'
# echo -en '        =*:/([<.//>*~/]\\+/_/([\\<://:_*try/<:#if~do-:\n'
# echo -en '       @#/*-:/#do./@var=\\<)]#>/=\\>\\<for#>|*:try="</\n'
# echo -en '       :/./@#[=#@~as|#:/~/@if.>#[.)=*>/let{}</):\\~\n'
# echo -en '      (@+_let#do/.@#=#>[/]#let=#or@\\=<()~if)*<)\\)\n'
# echo -en '      for):/=]@#try:</=*;/((+do_{/!"(@~/((:@>).*}\n'
# echo -en '      /@#:@try*@!\\as=\\>_@.>#+var>_@=>#+-do)=+@#>(\n'
# echo -en '      {}:/./@#=do]>/@if)=[/[!\\<)#)try+*:~/#).=})=\n'
# echo -en '      try@#_<(=</>do#.<}@#}\\\\=~*:/().<))_+@#()+\\>\n'
# echo -en '       *:#for@:@>):/#<\\=*>@\\var_}#|[/@*~/.<:if#/~\\\n'
# echo -en '       =<)=-\\(~for>//@if*=*+#as\\<)*:#for@{#)try+}).\n'
# echo -en '       [for()={#in=*:as=\\>_@-.>#do/:/(/[+var)=+@#]]=\n'
# echo -en '        /@[as:=\\+@#]=:/let[(=\\<_)</@~>#for()=))#>in>)_\n'
# echo -en '        *)\\{}/*<var/(>;<+/:do#/-)<\\(:as/>){})_+=<(for+=\\.\n'
# echo -en '         do=~\\@#=\\><<-))_|@#(])/)_+@let]:[+#\\=@/if[#()[=\n'
# echo -en '          =<])~if|/.=*@var<@:/(~)=*:/#)=*>@#var(<(]if):*\n'
# echo -en '          {/+_=@#as}#:/~/@if>in=@#{#in=>()@>](@#<{:})->\n'
# echo -en '           \\.=let_@<)#)_=\\<~#_)@}+@if#-[+#\\|=@#~try/as\n'
# echo -en '             var<:))+try-#>>+_+=)>@#>()<?>var)=~<+.-/\n'
# echo -en '              +@>#do(as)*+[#]=:/(/#\\<)if).+let:@{.#"\n'
# echo -en '               {}</().try()##/as<){*~</>}](as*>~/<\n'
# echo -en '                 <()if}*var(<>.~"_"~.let>#[.)=*>/\n'
# echo -en '                   "{}<as:"            "*)}do>"\n'
# 
