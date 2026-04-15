# Auto-start tmux SSH chooser on interactive SSH login
_tmux_ssh_chooser() {
    local chooser_bin="${TMUX_SSH_CHOOSER_BIN:-$HOME/.local/bin/tmux-ssh-chooser}"

    [[ $- == *i* ]] || return
    [[ -n "${SSH_CONNECTION:-}" ]] || return
    [[ -z "${TMUX:-}" ]] || return
    command -v tmux >/dev/null 2>&1 || return

    if [[ -x "$chooser_bin" ]]; then
        "$chooser_bin"
        return
    fi

    if ! tmux list-sessions >/dev/null 2>&1; then
        exec tmux new -s main
    fi
}

_tmux_ssh_chooser
unset -f _tmux_ssh_chooser
