#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# TODO: not sure if possible, xdg-open acts weird
# open_spotify() {
#   $(open -a Spotify)
# }

get_metadata() {
    busctl -j --user get-property org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Metadata
}

get_shuffle_status() {
    busctl -j --user get-property org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player \
        Shuffle | jq -r '.data'
}

get_loop_status() {
    busctl -j --user get-property org.mpris.MediaPlayer2.spotify \
        /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player LoopStatus | jq -r '.data'
}

show_not_running_menu() {
    tmux display-menu -T "#[align=centre fg=green] Spotify " -x R -y P \
        "Spotify is not running!" "" "" \
        \
        "" \
        "Close menu" q ""
    # "Open Spotify" o "run -b 'source \"$CURRENT_DIR/spotify.sh\" && open_spotify'" \
}

show_podcast_menu() {
    local metadata=$1
    local title
    title=$(echo "$metadata" | jq -r '.data["xesam:title"].data')
    local podcast
    podcast=$(echo "$metadata" | jq -r '.data["xesam:album"].data')
    local track_url
    track_url=$(echo "$metadata" | jq -r '.data["xesam:url"].data')
    tmux display-menu -T "#[align=centre fg=green] Spotify " -x R -y P \
        "" \
        "-#[nodim]Episode: $title" "" "" \
        "-#[nodim]Podcast: $podcast" "" "" \
        "" \
        "Play/Pause" p "run -b '$CURRENT_DIR/play_pause.sh'" \
        "Back 15s" b "run -b '$CURRENT_DIR/seek.sh -15'" \
        "Forward 15s" n "run -b '$CURRENT_DIR/seek.sh 15'" \
        "Copy URL" c "run -b \"$CURRENT_DIR/copy_url.sh '$track_url'\"" \
        "" \
        "Close menu" q ""

    # Seems like the rate is not supported by spotify
    # even Min/Max rate in DBus is always 1.0 no matter what the actual rate is
    # "Slow down" s "run -b '$CURRENT_DIR/speed.sh -0.1'" \
    # "Speed up" f "run -b '$CURRENT_DIR/speed.sh 0.1'" \
}

show_track_menu() {
    local metadata=$1
    local artist
    artist=$(echo "$metadata" | jq -r '.data["xesam:artist"].data[0]') # Spotify only sends the first artist anyway
    local track_name
    track_name=$(echo "$metadata" | jq -r '.data["xesam:title"].data')
    local album
    album=$(echo "$metadata" | jq -r '.data["xesam:album"].data')
    local track_url
    track_url=$(echo "$metadata" | jq -r '.data["xesam:url"].data')

    local is_shuffle_on
    is_shuffle_on=$(get_shuffle_status)
    local shuffling_label=""
    if [ "$is_shuffle_on" == "true" ]; then
        shuffling_label="Turn off shuffle"
    else
        shuffling_label="Turn on shuffle"
    fi

    local loop_status
    loop_status=$(get_loop_status)
    local repeating_label=""

    if [ "$loop_status" == "Track" ]; then
        repeating_label="Looping track"
    elif [ "$loop_status" == "Playlist" ]; then
        repeating_label="Looping playlist"
    else
        repeating_label="Not looping"
    fi

    tmux display-menu -T "#[align=centre fg=green] Spotify " -x R -y P \
        "" \
        "-#[nodim]Track: $track_name" "" "" \
        "-#[nodim]Artist: $artist" "" "" \
        "-#[nodim]Album: $album" "" "" \
        "" \
        "Play/Pause" p "run -b '$CURRENT_DIR/play_pause.sh'" \
        "Next" n "run -b '$CURRENT_DIR/next_track.sh'" \
        "Previous" b "run -b '$CURRENT_DIR/previous_track.sh'" \
        "$shuffling_label" s "run -b '$CURRENT_DIR/toggle_shuffle.sh $is_shuffle_on'" \
        "$repeating_label" r "run -b '$CURRENT_DIR/toggle_loop.sh $loop_status'" \
        "Copy URL" c "run -b \"$CURRENT_DIR/copy_url.sh '$track_url'\"" \
        "" \
        "Close menu" q ""
}

show_menu() {
    local spotify_pid
    spotify_pid=$(pidof -s spotify || pidof -s .spotify.wrapped)
    if [ -z "$spotify_pid" ]; then
        show_not_running_menu
        return
    fi

    local metadata
    metadata=$(get_metadata)
    local id
    id=$(echo "$metadata" | jq -r '.data["mpris:trackid"].data')

    if [[ $id == *"/episode/"* ]]; then
        show_podcast_menu "$metadata"
        return
    fi

    show_track_menu "$metadata"
}

show_menu
