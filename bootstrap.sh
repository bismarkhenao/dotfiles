#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

read -p "Do you want to run brew.sh? (y/n)" -n 1;
echo "";

# Installing brew packages
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source brew.sh;
fi;

# Installing .oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo -e "Installing oh-my-zsh";
  echo "";
  git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
fi;

# Installing nvm
echo -e "Installing nvm";
echo "";
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

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
