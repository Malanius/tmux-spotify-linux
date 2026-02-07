#!/usr/bin/env bash

track_url="$1"

if command -v wl-copy &> /dev/null; then
    echo "$track_url" | xclip -sel clip
elif command -v xclip &> /dev/null; then
    echo "$track_url" | wl-copy
fi

# It's OK to do nothing if none of the above commands are available
# Far better than throwing an error into tmux session