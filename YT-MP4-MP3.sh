#!/bin/bash

# Verificar si yt-dlp está instalado
if ! command -v yt-dlp &> /dev/null; then
    echo "[!] yt-dlp not found..."
    python3 -m pip install -U yt-dlp || { echo "[X] Error"; exit 1; }
fi

# Solicitar datos al usuario
read -rp "Enter media URL: " mediaURL
read -rp "Is this a video or audio? (v/a): " type

timestamp=$(date +%s)
filename="download_$timestamp"

if [ "$type" = "v" ]; then
    echo "[+] Downloading video..."
    yt-dlp -o "${filename}.mp4" -f "bv*+ba" --merge-output-format mp4 --user-agent "Mozilla/5.0" "$mediaURL"
elif [ "$type" = "a" ]; then
    echo "[+] Downloading audio..."
    yt-dlp -x --audio-format mp3 -o "${filename}.mp3" --user-agent "Mozilla/5.0" "$mediaURL"
else
    echo "Invalid input. Use 'v' for video or 'a' for audio."
    exit 1
fi

echo
echo "[✓] Done."
