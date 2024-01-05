#!/usr/bin/env bash

is_on=$1
echo "is_on: $is_on"
target=""
if [[ "$is_on" == "true" ]]; then
    target="false"
elif [[ "$is_on" == "false" ]]; then
    target="true"
else
    echo "Invalid argument: $is_on"
    exit 1
fi
echo "target: $target"

busctl --user set-property org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player \
    Shuffle b "$target"
