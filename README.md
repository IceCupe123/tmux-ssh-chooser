# tmux-ssh-chooser

Ein Bash-basierter tmux-Session-Chooser fuer interaktive SSH-Logins.

## Inhalt

- `bin/tmux-ssh-chooser`: der eigentliche Chooser
- `docs/bashrc-snippet.sh`: Hook fuer die `~/.bashrc`

## Verhalten

- startet nur fuer interaktive SSH-Shells
- startet `tmux new -s main`, wenn noch keine Session existiert
- zeigt links eine Session-Liste und rechts eine Preview
- `Enter` oeffnet die markierte Session
- `Ctrl-R` benennt die markierte Session um
- `Ctrl-X` beendet die markierte Session
- `q` oder `ESC` kehrt zur normalen Shell zurueck

## Installation

1. `bin/tmux-ssh-chooser` nach `~/.local/bin/tmux-ssh-chooser` verlinken oder kopieren
2. den Hook aus `docs/bashrc-snippet.sh` in die `~/.bashrc` aufnehmen

## Hinweis

Die laufende Installation auf diesem Host verwendet bereits `~/.local/bin/tmux-ssh-chooser`.
