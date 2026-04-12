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
