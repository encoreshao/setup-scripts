#!/usr/bin/env bash
set -e

echo "=== macOS setup ==="

# Install Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
  echo "→ Installing Xcode Command Line Tools..."
  xcode-select --install || true
else
  echo "→ Xcode Command Line Tools already installed."
fi

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "→ Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "→ Homebrew already installed."
fi

echo "→ Updating and installing basic packages..."
brew update
brew install git curl vim htop wget tree zsh

# Optional dev tools
brew install --cask iterm2 visual-studio-code google-chrome

# Optional cleanup
brew cleanup

echo "✅ macOS setup complete!"
