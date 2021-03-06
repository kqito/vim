#!/bin/bash

SCRIPT_DIR=($(cd $(dirname $BASH_SOURCE); pwd))
declare -a VIMRC_DIRS=("${HOME}/.vim")

check() {
  read -p "$1 (y/N): " yn

  case "$yn" in
    [yY]*) return 0 ;;
    *) return 1 ;;
  esac
}

installForVim() {
  echo "Installing kqito's vimrc..."

  mkdir -p ~/.config/

  for dir in ${VIMRC_DIRS[@]}; do
    rm -rf ${dir}
    cp -r ${SCRIPT_DIR} ${dir}
  done

  echo "Done!!"
}

installForNeovim() {
  neovimDir="${HOME}/.config/nvim/"
  echo "Installing kqito's vimrc so that neovim can use it..."

  mkdir -p $neovimDir

  cp "${SCRIPT_DIR}/nvim/init.vim" $neovimDir
  ln -s "${SCRIPT_DIR}/coc-settings.json" $neovimDir

  echo "Done!!"
}

isEmptyVimrcDir() {
  isEmpty=0

  for dir in ${VIMRC_DIRS[@]}; do
    if [ ! -z "$(ls -A ${dir})" ]; then
      echo "Your vimrc is exist!! => ${dir}"
      isEmpty=1
    fi
  done

  [ ${isEmpty} -eq 0 ] && return 0 || return 1
}


! isEmptyVimrcDir && $(! check "Remove all your vimrc to install kqito's vimrc?") && exit 0

installForVim

$(! check "You also use neovim? (If yes, make this vimrc available to neovim)") && exit 0

installForNeovim
