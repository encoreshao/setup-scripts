#!/usr/bin/env bash
set -e

echo "=== Setting up Git global configuration ==="

if ! git config --global user.name >/dev/null; then
  read -p "Enter your Git username: " username
  git config --global user.name "$username"
fi

if ! git config --global user.email >/dev/null; then
  read -p "Enter your Git email: " email
  git config --global user.email "$email"
fi

git config --global core.editor "vim"
git config --global color.ui auto
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global push.default simple
git config --global diff.tool vimdiff

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.amend "commit --amend --no-edit"
git config --global alias.tags "tag -l"
git config --global alias.remotes "remote -v"

echo "✅ Git config setup complete"
git config --global --list