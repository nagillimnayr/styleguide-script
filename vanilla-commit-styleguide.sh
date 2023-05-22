#!/bin/bash

##### Install git commit formatting tools #####
# Author: Ryan Milligan

# This script must be run from the root directory of a Git repo

# Install commitlint
npm install -D @commitlint/cli @commitlint/config-conventional
# Configure commitlint
echo "module.exports = {extends: ['@commitlint/config-conventional']}" >commitlint.config.js

# Install husky
npm install -D husky
# Enable git hooks
npx husky install
npm pkg set scripts.prepare="husky install"
# Add commit message hook
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit ${1}'

# Install commitlint VSCode extension
# This extension will provide linting in the VSCode commit message editor
code --install-extension joshbolduc.commitlint --force

# Install Commitizen
npm install -D commitizen

# Initialize Commitizen
npx commitizen init cz-conventional-changelog --save-dev --save-exact --force

# Set-up hooks so contributors will receive the commitizen prompt when using ‘git commit’
npx husky add .husky/prepare-commit-msg "exec < /dev/tty && node_modules/.bin/cz --hook || true"

# Add the commitizen friendly badge to the README.md:
echo "[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)" >>README.md
