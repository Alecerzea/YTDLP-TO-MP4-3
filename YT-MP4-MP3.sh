#!/bin/bash

# Check if yt-dlp is installed
if ! command -v yt-dlp >/dev/null 2>&1; then
    echo "yt-dlp is not installed or not in PATH."
    exit 1
fi

# Check if ffmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "ffmpeg is not installed or not in PATH."
    exit 1
fi

# Prompt user input
read -rp "Enter media URL: " mediaURL
read -rp "Is this a video or audio? (v/a): " type

timestamp=$(date +%s)
filename="download_$timestamp"

if [ "$type" = "v" ]; then
    echo "[+] Downloading video..."
    yt-dlp -o "${filename}.mp4" --format mp4 "$mediaURL"
elif [ "$type" = "a" ]; then
    echo "[+] Downloading audio as MP3..."
    yt-dlp -x --audio-format mp3 -o "${filename}.mp3" "$mediaURL"
else
    echo "Invalid input. Use 'v' for video or 'a' for audio."
    exit 1
fi

echo
echo "[✓] Done."
