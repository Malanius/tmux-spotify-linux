#!/usr/bin/env bash

offset_s=$1
current_position=$(busctl --user get-property org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Position | awk '{print $2}')

offset_us=$(($offset_s * 1000000))

busctl --user -- call org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Seek x $offset_us
