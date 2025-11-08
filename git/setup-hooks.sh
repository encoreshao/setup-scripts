#!/usr/bin/env bash
set -e

echo "=== Setting up Git hooks ==="

HOOKS_DIR=".githooks"
mkdir -p "$HOOKS_DIR"

# Example pre-commit hook
cat <<'EOF' > "$HOOKS_DIR/pre-commit"
#!/bin/sh
# Simple pre-commit hook to check for trailing spaces
if git diff --cached --check | grep -q 'trailing whitespace'; then
  echo "⚠️  Trailing whitespace found. Please fix before committing."
  exit 1
fi
EOF

chmod +x "$HOOKS_DIR/pre-commit"

# Configure git to use local hooks
git config core.hooksPath "$HOOKS_DIR"

echo "✅ Git hooks setup complete (pre-commit checks enabled)."
