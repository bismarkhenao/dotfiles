#!/usr/bin/env bash

declare -a extensions=(
  'christian-kohler.npm-intellisense'
  'CoenraadS.bracket-pair-colorizer'
  'dbaeumer.vscode-eslint'
  'dzannotti.vscode-babel-coloring'
  'EditorConfig.EditorConfig'
  'esbenp.prettier-vscode'
  'file-icons.file-icons'
  'naumovs.color-highlight'
  'tinkertrain.theme-panda'
  'wayou.vscode-todo-highlight'
  'yzhang.markdown-all-in-one'
);

for extension in "${extensions[@]}"; do
  code --install-extension $extension;
done;
