#!/usr/bin/env bash
set -e

echo "=== Performing basic system setup ==="

if command -v apt >/dev/null; then
  echo "→ Updating and installing base packages (Debian/Ubuntu)"
  sudo apt update -y
  sudo apt install -y git curl vim htop unzip build-essential
elif command -v yum >/dev/null; then
  echo "→ Installing base packages (RHEL/CentOS)"
  sudo yum install -y git curl vim htop unzip
elif command -v brew >/dev/null; then
  echo "→ Skipping base system setup (macOS handled separately)"
else
  echo "⚠️  Unsupported OS — skipping system setup."
fi

echo "✅ System setup complete."
