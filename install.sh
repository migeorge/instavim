#!/bin/bash

INSTAVIM_DIR=$HOME/.instavim
SOURCE_REPO=https://github.com/migeorge/instavim

clear;
echo "-- INSTAVIM --"
echo "-> This script will install vim and the set of config / plugins located at ${SOURCE_REPO}"
echo
read -p "-> Running this script will destroy and replace your vim config files, continue? [Y/n]" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  if [ -d "${INSTAVIM_DIR}" ]; then rm -Rf ${INSTAVIM_DIR}; fi

  echo "--> Cloning INSTAVIM repository to ${INSTAVIM_DIR}"
  git clone --recursive "${SOURCE_REPO}.git" ${INSTAVIM_DIR}

  if ! type "vim" > /dev/null; then
    echo "--> vim command not found, attempting install"
    if [[ `uname` == 'Linux' ]]
    then
      apt-get update
      apt-get install vim
    fi

    if [[ `uname` == 'Darwin' ]]
    then
      brew install vim
    fi
  fi

  echo "--> Linking INSTAVIM configs"

  mkdir -p ${HOME}/.vim/colors

  # Symlink Plugins / Colors
  ln -s ${INSTAVIM_DIR}/plugins/vim-dichromatic/colors/dichromatic.vim ${HOME}/.vim/colors/dichromatic.vim

  # Symlink .vimrc
  ln -s ${INSTAVIM_DIR}/.vimrc ${HOME}/.vimrc

  echo
  echo "-> vim is now configured and ready to use!"
  echo
fi
