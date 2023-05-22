#!/bin/bash

##### Install code style tools #####
# Author: Ryan Milligan

# Install VSCode Extensions for ESLint and Prettier ESLint
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension rvest.vs-code-prettier-eslint --force

# Install Prettier, ESlint, and Prettier ESlint
npm install -D prettier eslint prettier-eslint
# Install ESlint plug-ins and configs for the AirBnB style-guide
npm install -D eslint-plugin-import
npm install -D eslint-config-airbnb-base

# Create and write to ESlint config file
echo "module.exports = {
  extends: [
    'eslint:recommended',
    'plugin:import/recommended',

    'eslint-config-airbnb-base',
  ],
  plugins: ['prettier'],
  settings: {
    'import/resolver': {
      node: {
        paths: ['src'],
        extensions: ['.js', '.jsx', '.ts', '.tsx'],
      },
    },
  },
  env: {
    browser: true,
    node: true,
  },
};" >.eslintrc.js

# Create VSCode workspace settings directory
mkdir .vscode/
# Create and write to VSCode settings file
# These settings will set Prettier ESlint as the default formatter for the project
echo '
{
  "editor.defaultFormatter": "rvest.vs-code-prettier-eslint",
  "editor.formatOnPaste": false, 
  "editor.formatOnType": false, 
  "editor.formatOnSave": true,  
  "editor.formatOnSaveMode": "file", 
  "files.autoSave": "onFocusChange", 
  "vs-code-prettier-eslint.prettierLast": false
}' >.vscode/settings.json


