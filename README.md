# 🧰 setup-scripts

A cross-platform setup toolkit for developers.
Supports **macOS**, **Linux**, and **WSL** environments.

---

## 🚀 Quick Start

Clone the repo and run the bootstrap script:
```bash
git clone https://github.com/encoreshao/setup-scripts.git
cd setup-scripts
bash bootstrap.sh
````

This will automatically run all setup scripts in the `git/`, `shell/`, and `system/` folders.

---

## 📁 Repository Structure

```bash
setup-scripts/
├── bootstrap.sh            # Entry point for all setups
├── git/                    # Git config and hooks
│   ├── setup-git-config.sh
│   └── setup-hooks.sh
├── shell/                  # Shell aliases and themes
│   ├── setup-shell-aliases.sh
│   └── setup-zsh-theme.sh
├── system/                 # OS-level setup and utilities
│   ├── setup-system.sh
│   ├── setup-macos.sh
│   └── install-node.sh
└── README.md
```

---

## 💡 Add-ons

These scripts are modular — you can add more `.sh` files in their respective folders and `bootstrap.sh` will pick them up automatically.

### Git Add-ons

* **`setup-git-config.sh`** — configure global git aliases and basic settings
* **`setup-hooks.sh`** — example pre-commit hook to enforce coding rules

### Shell Add-ons

* **`setup-shell-aliases.sh`** — sets common shell aliases for convenience
* **`setup-zsh-theme.sh`** — install Oh My Zsh and set your preferred theme

### System Add-ons

* **`setup-system.sh`** — install basic system packages (Linux/WSL)
* **`setup-macos.sh`** — macOS-specific setup (Xcode CLI, Homebrew, dev tools)
* **`install-node.sh`** — install Node.js (cross-platform)

---

## ⚡ Usage Examples

Run **all scripts** at once:

```bash
bash bootstrap.sh
```

Run **individual scripts** if needed:

```bash
bash git/setup-git-config.sh
bash shell/setup-shell-aliases.sh
bash system/install-node.sh
```

---

## 🧠 Extend

1. Add any new `.sh` script to:

   * `git/` for Git-related scripts
   * `shell/` for shell environment tools
   * `system/` for OS-level utilities

2. The next time you run `bootstrap.sh`, all scripts in these folders will run automatically.

---

## 🔧 Notes

* On macOS, `setup-macos.sh` will handle Homebrew, dev tools, and optional apps.
* On Linux, `setup-system.sh` detects apt or yum and installs core packages.
* Zsh users: after running `setup-zsh-theme.sh`, restart your terminal or run `source ~/.zshrc`.

```

### 🪄 Usage

```bash
curl -fsSL https://raw.githubusercontent.com/encoreshao/setup-scripts/main/bootstrap.sh
```
