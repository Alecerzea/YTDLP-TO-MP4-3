@echo off

REM Prompt user input
set /p mediaURL=Enter media URL: 
set /p type=Is this a video or audio? (v/a): 

REM Get timestamp (seconds since epoch)
for /f "tokens=1" %%a in ('powershell -Command "(Get-Date -UFormat %%s)"') do set timestamp=%%a
set filename=download_%timestamp%

if /i "%type%"=="v" (
    echo [+] Downloading video...
    yt-dlp -o "%filename%.mp4" --format mp4 "%mediaURL%"
) else if /i "%type%"=="a" (
    echo [+] Downloading audio...
    yt-dlp -x --audio-format mp3 -o "%filename%.mp3" "%mediaURL%"
) else (
    echo Invalid input. Use 'v' for video or 'a' for audio.
    exit /b 1
)

echo.

echo [✓] Done.
