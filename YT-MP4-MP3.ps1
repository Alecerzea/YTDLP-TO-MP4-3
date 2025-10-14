$mediaURL = Read-Host "Enter media URL"
$type = Read-Host "Is this a video or audio? (v/a)"

if ($type -eq "v") {
    Write-Host "[+] Downloading video..."
    yt-dlp -f "bv*+ba/b" --merge-output-format mp4 -o "%(title)s.%(ext)s" --user-agent "Mozilla/5.0" $mediaURL
} elseif ($type -eq "a") {
    Write-Host "[+] Downloading audio..."
    yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" --user-agent "Mozilla/5.0" $mediaURL
} else {
    Write-Host "Invalid input. Use 'v' for video or 'a' for audio."
    exit 1
}
