#!/bin/bash

read -rp "Enter media URL: " mediaURL
read -rp "Is this a video or audio? (v/a): " type

if [ "$type" = "v" ]; then
    echo "[+] Downloading video..."
    yt-dlp -f "bv*+ba/b" --merge-output-format mp4 -o "%(title)s.%(ext)s" --user-agent "Mozilla/5.0" "$mediaURL"
elif [ "$type" = "a" ]; then
    echo "[+] Downloading audio..."
    yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" --user-agent "Mozilla/5.0" "$mediaURL"
else
    echo "Invalid input. Use 'v' for video or 'a' for audio."
    exit 1
fi
