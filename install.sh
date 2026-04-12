#!/usr/bin/env bash

set -eu

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.local/bin"
TARGET_BIN="${TARGET_DIR}/tmux-ssh-chooser"

mkdir -p "${TARGET_DIR}"
ln -sfn "${PROJECT_DIR}/bin/tmux-ssh-chooser" "${TARGET_BIN}"
chmod +x "${PROJECT_DIR}/bin/tmux-ssh-chooser"

cat <<'EOF'
Installiert:
- ~/.local/bin/tmux-ssh-chooser -> Repo-Version

Naechster Schritt:
- Hook aus docs/bashrc-snippet.sh in ~/.bashrc aufnehmen oder damit abgleichen
EOF
