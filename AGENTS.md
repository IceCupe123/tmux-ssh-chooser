# Repository Guidelines

## Project Structure & Module Organization

This repository is intentionally small:

- `bin/tmux-ssh-chooser`: main Bash TUI and tmux session chooser logic
- `install.sh`: installer that downloads the script to `~/.local/bin` and updates `~/.bashrc`
- `docs/bashrc-snippet.sh`: reference hook for manual shell integration
- `README.md`: user-facing installation and usage notes

There is no separate test or assets directory. Keep new code close to the script it belongs to, and avoid creating extra layers unless the repository clearly grows past its current size.

## Build, Test, and Development Commands

- `bash -n bin/tmux-ssh-chooser`: syntax-check the main script
- `bash -n install.sh`: syntax-check the installer
- `./install.sh`: install locally for manual testing
- `git status --short`: verify the working tree before committing

This project is validated mainly through Bash syntax checks and manual tmux/SSH testing.

## Coding Style & Naming Conventions

- Use Bash with `set -u` or `set -eu` where already established.
- Prefer 4-space indentation; do not mix tabs into shell logic.
- Keep functions small and action-oriented, e.g. `handle_enter`, `update_preview_pane`.
- Use uppercase for global configuration variables (`CHOOSER_SESSION`), lowercase for local variables.
- Keep user-facing text concise and in English unless the feature explicitly concerns localization.

## Testing Guidelines

There is no formal test framework in this repository yet. Minimum validation for changes:

1. Run `bash -n bin/tmux-ssh-chooser`.
2. Run `bash -n install.sh` if the installer changed.
3. Manually test the affected flow in tmux when behavior changes, especially session attach, rename, close, preview, and installer output.

## Commit & Pull Request Guidelines

Recent history uses short, imperative commit subjects, for example:

- `Use GitHub as default install source`
- `Polish chooser UX and rework installer`

Follow the same pattern: one concise subject line describing the change. PRs should include a short summary of user-visible behavior changes, any installer changes, and the commands used for validation.

## Security & Configuration Tips

- Do not commit secrets, tokens, or personal shell paths beyond standard home-directory locations.
- Keep installer defaults safe and overridable through environment variables where appropriate.
