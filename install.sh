#!/usr/bin/env bash

# get a relative path of this script
SCRIPTDIRABSPATH=$(cd $(dirname $0) && pwd)

printf "If you want to set the machine specific settings that are not supposed to be uploaded, create a script named 'privateval' in 'private' directory.\n"
printf ".bash_profile and .zprofile will load 'privateval'."

for f in {.??*,*}
do
    # exclude files
    [[ ${f} = .git ]] \
    || [[ ${f} = .gitignore ]] \
    || [[ ${f} = $0 ]] \
    || [[ ${f} = *DS_Store* ]] \
    || [[ ${f} = private ]] \
    || [[ ${f} = *.swp ]] \
    || [[ ${f} = install.sh ]] \
    || [[ ${f} = README.md ]] && continue

    SOURCEFILEABSPATH=${SCRIPTDIRABSPATH}/${f}

    if [ "$f" = "init.vim" ]; then
        # echo "${SOURCEFILEABSPATH}" "${HOME}/.config/nvim/${f}"
        mkdir -p "${HOME}/.config/nvim"
        ln -snfv "${SOURCEFILEABSPATH}" "${HOME}/.config/nvim/${f}"
        continue
    fi

    #echo "${SOURCEFILEABSPATH}" "${HOME}/${f}"
    ln -snfv "${SOURCEFILEABSPATH}" "${HOME}"/"${f}"
done

# For debug, print all variables
# set
