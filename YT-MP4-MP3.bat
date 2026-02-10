@echo off
set /p mediaURL=Enter media URL: 

echo [+] Downloading video (MP4, up to 1080p)...
yt-dlp -f "bv*[height<=1080][ext=mp4]+ba[ext=m4a]/b[height<=1080]" --merge-output-format mp4 "%mediaURL%"

echo.
echo [+] Downloading audio (MP3)...
yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" "%mediaURL%"

pause