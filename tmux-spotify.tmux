#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

main() {
  # TODO: ideally make this configurable, see https://github.com/xamut/tmux-spotify/pull/1
  $(tmux bind-key -T prefix S run -b "source $CURRENT_DIR/scripts/spotify.sh && show_menu")
}

main
