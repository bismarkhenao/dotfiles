#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo -e "Installing oh-my-zsh\n";
  git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
fi;

function sync() {
  rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "brew.sh" \
        --exclude "LICENSE" \
        --exclude "README.md" \
        -avh --no-perms . ~;

  if [ ${SHELL} != "/bin/zsh" ]; then
    chsh -s /bin/zsh;
  fi;

  exec zsh;
}

echo -e "\nInstall dotfiles\n";

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  sync;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sync;
  fi;
fi;

unset sync;
