# tmux-ssh-chooser

`tmux-ssh-chooser` is a Bash-based tmux session chooser for interactive SSH logins.

It opens automatically after SSH login, lets you pick an existing tmux session, create a new one, rename sessions, close sessions, and preview sessions directly inside the chooser UI.

## Features

- Starts only for interactive SSH shells
- Opens a new session automatically if no tmux session exists yet
- Session list on the left and live preview on the right
- Create, rename, and close sessions without leaving the chooser
- Favorites system: mark sessions to pin them to the top of the list
- Sort sessions by name, creation date, or last attach time
- Quick session access with number keys `1`–`9` and `0`
- Random session names as fallback when no name is entered
- Settings menu with language selection (German, English, Russian)
- Sort mode and language are saved and restored across sessions

## Installation

Run the installer to set up or update:

```bash
curl -fsSL https://raw.githubusercontent.com/IceCupe123/tmux-ssh-chooser/refs/heads/main/install.sh | bash
```

The installer will:

- download `tmux-ssh-chooser` to `~/.local/bin/tmux-ssh-chooser`
- make it executable
- add or update the required hook in `~/.bashrc`

After installation, open a new SSH session or reload your shell with:

```bash
source ~/.bashrc
```

If you integrate the hook manually or install the binary to a custom location, you can point the shell hook at it with `TMUX_SSH_CHOOSER_BIN=/path/to/tmux-ssh-chooser`.

## Requirements

- Bash
- tmux
- an interactive SSH login

## Controls

| Key | Action |
|-----|--------|
| `↑` / `↓` or `k` / `j` | navigate |
| `Enter` | open selected session |
| `n` | create new session and stay in chooser |
| `f` | mark or unmark selected session as favorite |
| `s` | cycle sort mode (name → created → last attach) |
| `1`–`9`, `0` | open session by number (0 = 10th) |
| `Ctrl-R` | rename selected session |
| `Ctrl-X` | close selected session |
| `q` / `Esc` | go back or return to the normal shell |
| `Backspace` | go back in submenus |

## Notes

- If you are already inside tmux, the chooser will not start again.
- If no tmux session exists yet, the chooser still opens and lets you create the first session.
- Favorites are stored in `~/.config/tmux-ssh-chooser/favorites`.
- Settings are stored in `~/.config/tmux-ssh-chooser/config`.
