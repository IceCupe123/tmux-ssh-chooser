#!/usr/bin/env bash

set -eu

REPO_OWNER="${REPO_OWNER:-IceCupe123}"
REPO_NAME="${REPO_NAME:-tmux-ssh-chooser}"
REPO_BRANCH="${REPO_BRANCH:-main}"
INSTALL_DIR="${HOME}/.local/bin"
TARGET_BIN="${INSTALL_DIR}/tmux-ssh-chooser"
BASHRC_FILE="${HOME}/.bashrc"
RAW_BIN_URL="${RAW_BIN_URL:-https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/refs/heads/${REPO_BRANCH}/bin/tmux-ssh-chooser}"
BEGIN_MARKER="# >>> tmux-ssh-chooser >>>"
END_MARKER="# <<< tmux-ssh-chooser <<<"

BASHRC_BLOCK=$(cat <<'EOF'
# >>> tmux-ssh-chooser >>>
# Auto-start tmux SSH chooser on interactive SSH login
_tmux_ssh_chooser() {
    [[ $- == *i* ]] || return
    [[ -n "${SSH_CONNECTION:-}" ]] || return
    [[ -z "${TMUX:-}" ]] || return
    command -v tmux >/dev/null 2>&1 || return

    if ! tmux list-sessions >/dev/null 2>&1; then
        exec tmux new -s main
    fi

    if [[ -x "$HOME/.local/bin/tmux-ssh-chooser" ]]; then
        "$HOME/.local/bin/tmux-ssh-chooser"
    fi
}

_tmux_ssh_chooser
unset -f _tmux_ssh_chooser
# <<< tmux-ssh-chooser <<<
EOF
)

download_bin() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$RAW_BIN_URL" -o "$TARGET_BIN"
        return
    fi

    if command -v wget >/dev/null 2>&1; then
        wget -qO "$TARGET_BIN" "$RAW_BIN_URL"
        return
    fi

    printf 'Error: curl or wget is required.\n' >&2
    exit 1
}

update_bashrc() {
    local tmp_file

    tmp_file=$(mktemp)
    touch "$BASHRC_FILE"

    if grep -Fq "$BEGIN_MARKER" "$BASHRC_FILE"; then
        awk -v begin="$BEGIN_MARKER" -v end="$END_MARKER" '
            $0 == begin { skip=1; next }
            $0 == end { skip=0; next }
            skip != 1 { print }
        ' "$BASHRC_FILE" > "$tmp_file"

        while [[ -s "$tmp_file" ]] && [[ "$(tail -n 1 "$tmp_file")" == "" ]]; do
            sed -i '$d' "$tmp_file"
        done
        printf '\n%s\n' "$BASHRC_BLOCK" >> "$tmp_file"
    else
        cat "$BASHRC_FILE" > "$tmp_file"
        if [[ -s "$tmp_file" ]] && [[ "$(tail -n 1 "$tmp_file")" != "" ]]; then
            printf '\n' >> "$tmp_file"
        fi
        printf '\n%s\n' "$BASHRC_BLOCK" >> "$tmp_file"
    fi

    mv "$tmp_file" "$BASHRC_FILE"
}

mkdir -p "$INSTALL_DIR"
download_bin
chmod +x "$TARGET_BIN"
update_bashrc

cat <<EOF
Installed:
- $TARGET_BIN
- Bashrc hook added or updated in $BASHRC_FILE

Source:
- $RAW_BIN_URL

Next step:
- open a new SSH session or reload ~/.bashrc
EOF
