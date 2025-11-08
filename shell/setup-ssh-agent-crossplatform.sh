#!/usr/bin/env bash
set -e

SSH_KEY="$HOME/.ssh/id_ed25519"
OS="$(uname -s)"

if [ ! -f "$SSH_KEY" ]; then
    echo "❌ SSH key not found at $SSH_KEY"
    exit 1
fi

echo "=== Setting up SSH key for $OS ==="

# ----------------------------
# macOS setup
# ----------------------------
if [[ "$OS" == "Darwin" ]]; then
    echo "→ macOS detected: adding key to Keychain and LaunchAgent"
    # Add key to Keychain
    ssh-add --apple-use-keychain "$SSH_KEY" || ssh-add -K "$SSH_KEY"

    # Create LaunchAgent
    PLIST_PATH="$HOME/Library/LaunchAgents/com.user.setup-ssh-agent-crossplatform.plist"
    mkdir -p "$(dirname "$PLIST_PATH")"

    cat > "$PLIST_PATH" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.setup-ssh-agent-crossplatform</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/setup-ssh-agent-crossplatform</string>
        <string>--apple-use-keychain</string>
        <string>$SSH_KEY</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardErrorPath</key>
    <string>/tmp/setup-ssh-agent-crossplatform.err</string>
    <key>StandardOutPath</key>
    <string>/tmp/setup-ssh-agent-crossplatform.out</string>
</dict>
</plist>
EOF

    launchctl unload "$PLIST_PATH" 2>/dev/null || true
    launchctl load "$PLIST_PATH"
    echo "✅ macOS LaunchAgent loaded. SSH key will auto-load at login."

# ----------------------------
# Linux/WSL setup
# ----------------------------
elif [[ "$OS" == "Linux" ]]; then
    echo "→ Linux/WSL detected: starting ssh-agent"

    # Start ssh-agent if not running
    if ! pgrep -u "$USER" ssh-agent >/dev/null; then
        eval "$(ssh-agent -s)"
    fi

    # Add key
    ssh-add "$SSH_KEY"

    # Persist for future sessions (bash/zsh)
    PROFILE="$HOME/.bashrc"
    [ -f "$HOME/.zshrc" ] && PROFILE="$HOME/.zshrc"

    if ! grep -q "ssh-agent" "$PROFILE"; then
        cat >> "$PROFILE" <<'EOF'

# SSH agent auto-start
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval "$(ssh-agent -s)" >/dev/null
    ssh-add ~/.ssh/id_ed25519
fi
EOF
        echo "✅ Added ssh-agent auto-start to $PROFILE"
    fi
else
    echo "⚠️ Unsupported OS: $OS"
fi

echo "✅ SSH key setup completed!"
