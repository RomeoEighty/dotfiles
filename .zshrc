if [ ! -z "${HOMEBREW_PREFIX}" ]; then
    export PATH=${HOMEBREW_PREFIX}/sbin:${HOMEBREW_PREFIX}/bin:$PATH
fi
export MANPAGER='nvim +Man!'
# Colorize
autoload -Uz colors

if [ -t 0 ]; then
    # Disable START/STOP output controls.
    stty -ixon
fi

# --------------------------------------
# rbenv
# --------------------------------------
# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"


# setopt correct
# setopt correct_all


setopt nonomatch


# --------------------------------------
# COMPLETION SETTING
# --------------------------------------
#- -U also causes alias expansion to be suppressed when the function is loaded., -z:load zsh-style
autoload -Uz compinit
compinit -u
# without input "cd", just input directory you want to move
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt list_types
setopt auto_param_keys
setopt auto_param_slash
zstyle ':completion:*:default' menu select=2
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt list_packed
setopt correct
setopt mark_dirs
setopt noautoremoveslash
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'
unsetopt promptcr
setopt nobeep
setopt auto_pushd
setopt pushd_ignore_dups
setopt magic_equal_subst
setopt numeric_glob_sort
setopt print_eight_bit
setopt auto_cd
setopt interactive_comments

# --------------------------------------
# HISTORY SETTING
# --------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=5000000

#-zsh sessions will append their history list to the history  le, rather than replace it.
setopt APPEND_HISTORY
#-Perform textual history expansion, csh-style, treating the character '!' specially.
# setopt BANG_HIST
#-Save each command’s beginning timestamp
setopt EXTENDED_HISTORY
#-Setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event from the list.
setopt HIST_EXPIRE_DUPS_FIRST
#-When searching for history entries in the line editor, do not display duplicates of a line previously found.
setopt HIST_FIND_NO_DUPS
#-If a new command line being added to the history list duplicates an older one, the older command is removed from the list.
setopt HIST_IGNORE_ALL_DUPS
#-Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS
#-Remove command lines from the history list when the  rst character on the line is a spaceRemove command lines from the history list when the  rst character on the line is a space.
setopt HIST_IGNORE_SPACE
#-Remove super uous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY         # $BJ#?t%?!<%_%J%kMzNrJ]B8(B

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    [[  ${cmd} != (pwd)
        #&& ${cmd} != (l[sal])
        #&& ${cmd} != (man)
        && ${cmd} != (exit)
        && ${cmd} != (alias)
        && ${cmd} != (fg)
    ]]
}

# --------------------------------------
# BINDKEYS SETTING
# --------------------------------------
export EDITOR='nvim' # This setting change bindkey to vim-style. So, bindkey -e is put after this line.
bindkey -e
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^[[Z" reverse-menu-complete

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-charhi
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-ro-history
bindkey -M menuselect 'l' vi-forward-char

# --------------------------------------
# PROMPT SETTING
# --------------------------------------
setopt PROMPT_SUBST
#export TERM="xterm-256color"
# bash: \n\[\e[1;90m\]\#\[\e[0;32m\] \u [\[\e[38;5;88m\]Darwin 15.5.0\[\e[0;32m\]] \[\e[38;5;68m\]\w\e[m\n\t \[\e[4;40;32m\]$?\[\e[0m\] \[\e[38;5;22m\]$ \[\033[0m\]
function precmd {
    echo -en "\n"
}

osname=$(uname)
case ${osname} in
    "Linux" )
        promptcolor_historyeventnum=$'%{\e[1;90m%}'
        promptcolor_os=$'%{\e[38;5;006m%}'
        promptcolor_username=$'%{\e[38;5;025m%}'
        promptcolor_pwd=$'%{\e[38;5;68m%}'
        promptcolor_status=$'%{\e[4;36m%}'
        promptcolor_shellprivilege=$'%{\e[38;5;25m%}'
        ;;
    "Darwin" )
        promptcolor_historyeventnum=$'%{\e[1;90m%}'
        promptcolor_os=$'%{\e[38;5;088m%}'
        promptcolor_username=$'%{\e[0;32m%}'
        promptcolor_pwd=$'%{\e[38;5;68m%}'
        promptcolor_status=$'%{\e[4;40;32m%}'
        promptcolor_shellprivilege=$'%{\e[38;5;22m%}'
        ;;
    ? )
        promptcolor_historyeventnum=$'%{\e[1;90m%}'
        promptcolor_os=$'%{\e[38;5;015m%}'
        promptcolor_username=$'%{\e[0;32m%}'
        promptcolor_pwd=$'%{\e[38;5;68m%}'
        promptcolor_status=$'%{\e[4;40;32m%}'
        promptcolor_shellprivilege=$'%{\e[38;5;22m%}'
        ;;
esac
PROMPT=$'${promptcolor_historyeventnum}%! ${promptcolor_username}%n [${promptcolor_os}$(uname -sr)${promptcolor_username}] ${promptcolor_pwd}%~%{\e[m%}\n%* ${promptcolor_status}%?%{\e[0m%} ${promptcolor_shellprivilege}%# %{\e[0m%}%'

## Update prompt every second -> too fancy
#TMOUT=1
TRAPALRM() {
    if [ "$WIDGET" != "expand-or-complete" ]; then
        zle reset-prompt
    fi
}


if [[ -f ~/.aliases ]]; then
    . ~/.aliases
    echo -en "Source ~/.aliases\n"
fi
#if [[ -f ~/.zshrc ]]; then
#    . ~/.zshrc
#    echo -en "Source ~/.zshrc\n"
#fi

echo -en "\nWelcome back, Sir\n"
echo -en '\n'
echo -en '[Current terminal]:\n\t'
who am I
echo -en '\n'
echo -en '[Zsh Version]:\n\t'
echo $ZSH_VERSION
echo -en '\n'



unalias run-help
autoload run-help
if [ ! -z "${HOMEBREW_PREFIX}" ]; then
    HELPDIR=${HOMEBREW_PREFIX}/share/zsh/help
fi

# --------------------------------------
# zsh alias
# --------------------------------------
disable r
alias help='run-help'
alias vizenv='vim ~/.zshenv; echo -en "\nrebooting zsh\n"; exec zsh -l'
alias vizrc='vim ~/.zshrc; echo -en "\nrebooting zsh\n"; exec zsh -l'
alias vihist='vim ~/.zsh_history'
alias vibrc='vim ~/.bashrc'
alias vibprofile='vim ~/.bash_profile'
alias viinputrc='vim ~/.inputrc'

# --------------------------------------
# vcs_info setting
# -> more info : http://qiita.com/mollifier/items/8d5a627d773758dd8078
# --------------------------------------

RPROMPT=""

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors

# 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3

# For performance, disable all the other VSC than git
zstyle ':vcs_info:*' enable git #svn hg bzr
# # 標準のフォーマット(git 以外で使用)
# # misc(%m) は通常は空文字列に置き換えられる
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
# zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
# zstyle ':vcs_info:bzr:*' use-simple true


if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi

# hooks 設定
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する

    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
    zstyle ':vcs_info:git+set-message:*' hooks \
                                            git-hook-begin \
                                            git-untracked \
                                            git-push-status \
                                            git-nomerge-branch \
                                            git-stash-count

    # フックの最初の関数
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi

        return 0
    }

    # untracked ファイル表示
    #
    # untracked ファイル(バージョン管理されていないファイル)がある場合は
    # unstaged (%u) に ? を表示
    function +vi-git-untracked() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            # unstaged (%u) に追加
            hook_com[unstaged]+='?'
        fi
    }

    # push していないコミットの件数表示
    #
    # リモートリポジトリに push していないコミットの件数を
    # pN という形式で misc (%m) に表示する
    function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" != "master" ]]; then
            # master ブランチでない場合は何もしない
            return 0
        fi

        # push していないコミット数を取得する
        local ahead
        ahead=$(command git rev-list origin/master..master 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+="(p${ahead})"
        fi
    }

    # マージしていない件数表示
    #
    # master 以外のブランチにいる場合に、
    # 現在のブランチ上でまだ master にマージしていないコミットの件数を
    # (mN) という形式で misc (%m) に表示
    function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" == "master" ]]; then
            # master ブランチの場合は何もしない
            return 0
        fi

        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            # misc (%m) に追加
            hook_com[misc]+="(m${nomerged})"
        fi
    }


    # stash 件数表示
    #
    # stash している場合は :SN という形式で misc (%m) に表示
    function +vi-git-stash-count() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+=":S${stash}"
        fi
    }

fi

function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt=""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # 間にスペースを入れて連結する
        prompt="${(j: :)messages}"
    fi

    RPROMPT="$prompt"
}
add-zsh-hook precmd _update_vcs_info_msg
# --------------------------------------
# END vcs_info setting
# --------------------------------------

# --------------------------------------
# zsh-completions Caveats
# --------------------------------------
# To activate these completions, add the following to your .zshrc:
if [ ! -z "${HOMEBREW_PREFIX}" ] && type brew &>/dev/null; then
    fpath=(${HOMEBREW_PREFIX}/share/zsh-completions $fpath)
    autoload -Uz compinit
    compinit
fi
# You may also need to force rebuild `zcompdump`:
#
#   rm -f ~/.zcompdump; compinit
#
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
#
#   chmod go-w ${HOMEBREW_PREFIX}'/share'
# --------------------------------------
# zsh-completions Caveats END
# --------------------------------------
if [ ! -z "${HOMEBREW_PREFIX}" ]; then
    source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
