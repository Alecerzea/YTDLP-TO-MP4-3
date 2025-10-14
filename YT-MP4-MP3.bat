@echo off
set /p mediaURL=Enter media URL: 
set /p type=Is this a video or audio? (v/a): 

if /i "%type%"=="v" (
    echo [+] Downloading video...
    yt-dlp -f "bv*+ba/b" --merge-output-format mp4 -o "%(title)s.%(ext)s" --user-agent "Mozilla/5.0" "%mediaURL%"
) else if /i "%type%"=="a" (
    echo [+] Downloading audio...
    yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" --user-agent "Mozilla/5.0" "%mediaURL%"
) else (
    echo Invalid input. Use 'v' for video or 'a' for audio.
    exit /b 1
)

pause
