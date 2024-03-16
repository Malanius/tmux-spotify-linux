#!/usr/bin/env bash

current_loop=$1
target=""
if [[ "$current_loop" == "None" ]]; then
    target="Playlist"
elif [[ "$current_loop" == "Playlist" ]]; then
    target="Track"
else
    target="None"
fi

busctl --user set-property org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player \
    LoopStatus s "$target"
