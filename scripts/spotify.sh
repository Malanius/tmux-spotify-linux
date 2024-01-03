#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# TODO: not sure if possible, xdg-open acts weird
# open_spotify() {
#   $(open -a Spotify)
# }

get_metadata() {
  echo $(busctl -j --user get-property org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Metadata)
}

toggle_play_pause() {
  $(osascript -e "tell application \"Spotify\" to playpause")
}

previous_track() {
  $(osascript -e "tell application \"Spotify\" to previous track")
}

next_track() {
  $(osascript -e "tell application \"Spotify\" to next track")
}

toggle_repeat() {
  if [ "$1" == "true" ]; then
    $(osascript -e "tell application \"Spotify\" to set repeating to false")
  else
    $(osascript -e "tell application \"Spotify\" to set repeating to true")
  fi
}

get_shuffle_status() {
  echo $(busctl -j --user get-property org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Shuffle | jq -r '.data')
}

toggle_shuffle() {
  if [ "$1" == "true" ]; then
    $(osascript -e "tell application \"Spotify\" to set shuffling to false")
  else
    $(osascript -e "tell application \"Spotify\" to set shuffling to true")
  fi
}

show_menu() {
  local spotify_pid=$(pidof -s spotify || pidof -s .spotify.wrapped)
  if [ -z "$spotify_pid" ]; then
    $(
      tmux display-menu -T "#[align=centre fg=green]Spotify" -x R -y P \
        "Spotify is not runnning!" "" "" \
        \
        "" \
        "Close menu" q "" # "Open Spotify" o "run -b 'source \"$CURRENT_DIR/spotify.sh\" && open_spotify'" \
    )
  # elif [[ $id == *":episode:"* ]]; then
  # TODO: handle this after songs are working correctly
  #   $(tmux display-menu -T "#[align=centre fg=green]Spotify" -x R -y P \
  #       "" \
  #       "-#[nodim]Episode: $track_name" "" "" \
  #       "-#[nodim]Podcast: $album"      "" "" \
  #       "" \
  #       "Copy URL"         c "run -b 'printf \"%s\" $id | pbcopy'" \
  #       "Open Spotify"     o "run -b 'source \"$CURRENT_DIR/spotify.sh\" && open_spotify'" \
  #       "Play/Pause"       p "run -b 'source \"$CURRENT_DIR/spotify.sh\" && toggle_play_pause'" \
  #       "Previous"         b "run -b 'source \"$CURRENT_DIR/spotify.sh\" && previous_track'" \
  #       "Next"             n "run -b 'source \"$CURRENT_DIR/spotify.sh\" && next_track'" \
  #       "$repeating_label" r "run -b 'source \"$CURRENT_DIR/spotify.sh\" && toggle_repeat $is_repeat_on'" \
  #       "$shuffling_label" s "run -b 'source \"$CURRENT_DIR/spotify.sh\" && toggle_shuffle $is_shuffle_on'" \
  #       "" \
  #       "Close menu"       q "" \
  #   )
  else
    local metadata=$(get_metadata)
    local artist=$(echo $metadata | jq -r '.data["xesam:artist"].data[0]') # Spotify only sends the first artist anywas
    local track_name=$(echo $metadata | jq -r '.data["xesam:title"].data')
    local album=$(echo $metadata | jq -r '.data["xesam:album"].data')
    local id=$(echo $metadata | jq -r '.data["mpris:trackid"].data')

    local is_shuffle_on=$(get_shuffle_status)
    local shuffling_label=""
    if [ "$is_shuffle_on" == "true" ]; then
      shuffling_label="Turn off shuffle"
    else
      shuffling_label="Turn on shuffle"
    fi

    local is_repeat_on=${arr[0]}
    local repeating_label=""

    if [ "$is_repeat_on" == "true" ]; then
      repeating_label="Turn off repeat"
    else
      repeating_label="Turn on repeat"
    fi

    $(
      tmux display-menu -T "#[align=centre fg=green] Spotify " -x R -y P \
        "" \
        "-#[nodim]Track: $track_name" "" "run -b 'printf \"%s\" $quoted_track_name | pbcopy'" \
        "-#[nodim]Artist: $artist" "" "" \
        "-#[nodim]Album: $album" "" "" \
        "" \
        "Copy URL" c "run -b 'printf \"%s\" $id | pbcopy'" \
        "Open Spotify" o "run -b 'source \"$CURRENT_DIR/spotify.sh\" && open_spotify'" \
        "Play/Pause" p "run -b 'source \"$CURRENT_DIR/spotify.sh\" && toggle_play_pause'" \
        "Previous" b "run -b 'source \"$CURRENT_DIR/spotify.sh\" && previous_track'" \
        "Next" n "run -b 'source \"$CURRENT_DIR/spotify.sh\" && next_track'" \
        "$repeating_label" r "run -b 'source \"$CURRENT_DIR/spotify.sh\" && toggle_repeat $is_repeat_on'" \
        "$shuffling_label" s "run -b 'source \"$CURRENT_DIR/spotify.sh\" && toggle_shuffle $is_shuffle_on'" \
        "" \
        "Close menu" q ""
    )
  fi
}
