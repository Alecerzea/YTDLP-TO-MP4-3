@echo off

REM Solicit URL
set /p mediaURL=Enter media URL: 
set /p type=Is this a video or audio? (v/a): 

REM timestamp
for /f "tokens=1" %%a in ('powershell -Command "(Get-Date -UFormat %%s)"') do set timestamp=%%a
set filename=download_%timestamp%

REM Download
if /i "%type%"=="v" (
    echo [+] Downloading video...
    yt-dlp -o "%filename%.mp4" -f "bv*+ba" --merge-output-format mp4 --user-agent "Mozilla/5.0" "%mediaURL%"
) else if /i "%type%"=="a" (
    echo [+] Downloading audio...
    yt-dlp -x --audio-format mp3 -o "%filename%.mp3" --user-agent "Mozilla/5.0" "%mediaURL%"
) else (
    echo Invalid input. Use 'v' for video or 'a' for audio.
    exit /b 1
)

echo.
echo [✓] Done.
pause
