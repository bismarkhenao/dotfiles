#!/usr/bin/env bash

if [[ $(command -v brew) == "" ]]; then
  echo "Installing Homebrew.. "
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Updating Homebrew.. "
  brew update
  brew upgrade
fi;

# Install command-line tools using Homebrew
declare -a clis=(
  'git'
  'node'
  'yarn'
  'heroku'
  'unrar'
  'gnupg'
  'wget'
);

for cli in "${clis[@]}"; do
  if ! brew ls --versions $cli > /dev/null; then
    brew install $cli
  fi;
done;
unset cli;

# Install binaries using Homebrew cask
declare -a binaries=(
  'visual-studio-code'
  'spotify'
  'google-chrome'
  'firefox'
  'hyper'
  'slack'
  'docker'
);

for binary in "${binaries[@]}"; do
  if ! brew cask ls --versions ${binary} &> /dev/null; then
    brew cask install $binary
  fi;

  if [ $binary == "visual-studio-code" ]; then
    source ${PWD}/vscode.sh;
  fi;
done;

# Cleanup
brew cleanup
