#!/usr/bin/env bash

busctl --user call org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player \
    Previous
