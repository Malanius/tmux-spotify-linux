#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

main() {
  $(tmux bind-key -T prefix s run -b "source $CURRENT_DIR/scripts/spotify.sh && show_menu")
}

main
