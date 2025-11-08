#!/usr/bin/env bash
set -e

echo "=== 🧰 Running Bootstrap Setup ==="
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"

run_scripts_in_dir() {
  local dir="$1"
  if [ -d "$dir" ]; then
    for script in "$dir"/*.sh; do
      [ -f "$script" ] || continue
      echo "--- Running: $script ---"
      bash "$script"
      echo
    done
  fi
}

# 1️⃣ Git scripts
echo "→ Setting up Git config and hooks"
run_scripts_in_dir "$BASE_DIR/git"

# 2️⃣ Shell scripts
echo "→ Setting up Shell environment"
run_scripts_in_dir "$BASE_DIR/shell"

# 3️⃣ System scripts
echo "→ Running System setup"
run_scripts_in_dir "$BASE_DIR/system"

# 4️⃣ macOS-specific setup
if [[ "$OS" == "Darwin" ]]; then
  MACOS_SCRIPT="$BASE_DIR/system/setup-macos.sh"
  if [ -f "$MACOS_SCRIPT" ]; then
    echo "→ Detected macOS — running macOS-specific setup"
    bash "$MACOS_SCRIPT"
  fi
fi

echo "✅ All setup scripts completed successfully!"
