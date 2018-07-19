#!/usr/bin/env bash

if [[ $(command -v brew) == "" ]]; then 
  echo "Installing Homebrew.. "
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Updating Homebrew.. "
  brew update
fi

# Install command-line tools using Homebrew
brew upgrade

brew install git
brew install node
brew install yarn
brew install heroku
brew install unrar
brew install gnupg
brew install wget

brew cleanup
