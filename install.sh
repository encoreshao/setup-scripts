#!/usr/bin/env bash
set -e

echo "=== Installing setup-scripts via curl ==="
bash -c "$(curl -fsSL https://raw.githubusercontent.com/encoreshao/setup-scripts/main/bootstrap.sh)"
echo "✅ setup-scripts installed successfully!"