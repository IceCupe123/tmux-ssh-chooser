# tmux-ssh-chooser

Ein Bash-basierter tmux-Session-Chooser fuer interaktive SSH-Logins.

## Projektstruktur

- `bin/tmux-ssh-chooser`: der eigentliche Chooser
- `docs/bashrc-snippet.sh`: Hook fuer die `~/.bashrc`
- `install.sh`: laedt das Script nach `~/.local/bin` und traegt den Hook in `~/.bashrc` ein
- `TODO.md`: offene Punkte fuer Bedienung und UI

## Verhalten

- startet nur fuer interaktive SSH-Shells
- startet `tmux new -s main`, wenn noch keine Session existiert
- zeigt links eine Session-Liste und rechts eine Preview
- `Enter` oeffnet die markierte Session
- `Ctrl-R` benennt die markierte Session um
- `Ctrl-X` beendet die markierte Session
- `q` oder `ESC` kehrt zur normalen Shell zurueck

## Installation

1. `curl -fsSL https://git.dotzip.de/IceCupe123/tmux-ssh-chooser/raw/branch/main/install.sh | bash`
2. neue SSH-Session oeffnen oder `source ~/.bashrc` ausfuehren

## Entwicklung

- aktives Repo: `~/dev/tmux-ssh-chooser`
- Live-Installation: `~/.local/bin/tmux-ssh-chooser`
- auf diesem Host ist `~/.local/bin/tmux-ssh-chooser` auf die Repo-Version verlinkt

## Aktueller Stand

- der Chooser ist jetzt vom Home-Verzeichnis in ein eigenes Git-Projekt ueberfuehrt
- das Projekt ist nach Gitea gepusht
- offene Punkte fuer UX und TUI-Verhalten stehen in `TODO.md`

## Hinweis

Die laufende Installation auf diesem Host verwendet bereits `~/.local/bin/tmux-ssh-chooser`.
