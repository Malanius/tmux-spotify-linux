speed_offset=$1

current_speed=$(busctl --user get-property org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Rate | awk '{print $2}')

new_speed=$(echo "$current_speed + $speed_offset" | bc -l)

busctl --user -- set-property org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player Rate d $new_speed
