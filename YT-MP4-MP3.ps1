# Prompt for input
$mediaURL = Read-Host "Enter media URL"
$type = Read-Host "Is this a video or audio? (v/a)"
$timestamp = Get-Date -UFormat %s
$filename = "download_$timestamp"

if ($type -eq "v") {
    Write-Host "[+] Downloading video..."
    yt-dlp -o "${filename}.mp4" -f "bv*+ba" --merge-output-format mp4 --user-agent "Mozilla/5.0" $mediaURL

} elseif ($type -eq "a") {
    Write-Host "[+] Downloading audio..."
    yt-dlp -x --audio-format mp3 -o "${filename}.mp3" --user-agent "Mozilla/5.0" $mediaURL

} else {
    Write-Host "Invalid input. Use 'v' for video or 'a' for audio."
    exit
}

Write-Host "`n[✓] Done."
