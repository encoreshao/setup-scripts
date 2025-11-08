#!/usr/bin/env bash
set -e

echo "=== Configuring shell aliases ==="

ALIASES_FILE="$HOME/.bash_aliases"

cat <<'EOF' > "$ALIASES_FILE"
# Common developer shortcuts
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias v='vim'
alias ..='cd ..'
EOF

# Ensure it's sourced automatically
for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  [ -f "$rc" ] || continue
  if ! grep -q ".bash_aliases" "$rc"; then
    echo "source ~/.bash_aliases" >> "$rc"
  fi
done

echo "✅ Shell aliases configured in $ALIASES_FILE"
