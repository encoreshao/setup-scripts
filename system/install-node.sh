#!/usr/bin/env bash
set -e

echo "=== Installing Node.js ==="

# Detect OS
OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  if ! command -v node >/dev/null; then
    echo "→ Installing Node.js via Homebrew"
    brew install node
  else
    echo "→ Node.js already installed: $(node -v)"
  fi
elif command -v apt >/dev/null; then
  echo "→ Installing Node.js via apt"
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt install -y nodejs
elif command -v yum >/dev/null; then
  echo "→ Installing Node.js via yum"
  curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
  sudo yum install -y nodejs
else
  echo "⚠️  Unsupported OS. Please install Node.js manually."
fi

echo "✅ Node.js installation complete: $(node -v)"
