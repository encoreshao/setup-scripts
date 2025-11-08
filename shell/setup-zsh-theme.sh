#!/usr/bin/env bash
set -e

echo "=== Setting up Zsh theme ==="

ZSHRC="$HOME/.zshrc"
THEME="agnoster"  # you can change to powerlevel10k or other theme

# Install oh-my-zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "→ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "→ Oh My Zsh already installed."
fi

# Set theme
sed -i.bak "s/^ZSH_THEME=.*/ZSH_THEME=\"$THEME\"/" "$ZSHRC"

echo "✅ Zsh theme set to $THEME. Restart your terminal or run 'source ~/.zshrc'."
