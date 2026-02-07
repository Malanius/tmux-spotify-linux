#!/usr/bin/env bash

track_url="$1"

if command -v xclip &> /dev/null; then
    echo "$track_url" | xclip -sel clip
fi

if command -v wl-copy &> /dev/null; then
    echo "$track_url" | wl-copy
fi
