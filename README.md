# tmux-ssh-chooser

`tmux-ssh-chooser` is a Bash-based tmux session chooser for interactive SSH logins.

It opens automatically after SSH login, lets you pick an existing tmux session, create a new one, rename sessions, close sessions, and preview sessions directly inside the chooser UI.

## Features

- Starts only for interactive SSH shells
- Opens `tmux new -s main` automatically if no tmux session exists yet
- Session list on the left and live preview on the right
- Create new sessions without leaving the chooser
- Rename and close sessions from the chooser
- Settings menu with language selection
- Available in German, English, and Russian

## Installation

Run:

```bash
curl -fsSL https://git.dotzip.de/IceCupe123/tmux-ssh-chooser/raw/branch/main/install.sh | bash
```

The installer will:

- download `tmux-ssh-chooser` to `~/.local/bin/tmux-ssh-chooser`
- make it executable
- add or update the required hook in `~/.bashrc`

After installation, open a new SSH session or reload your shell with:

```bash
source ~/.bashrc
```

## Requirements

- Bash
- tmux
- an interactive SSH login

## Controls

- `Enter`: open or confirm the selected item
- `Ctrl-R`: rename selected session
- `Ctrl-X`: close selected session
- `q` or `Esc`: go back or return to the normal shell
- `Backspace`: go back in submenus

## Notes

- If you are already inside tmux, the chooser will not start again.
- If no tmux session exists, a new `main` session is created immediately.
