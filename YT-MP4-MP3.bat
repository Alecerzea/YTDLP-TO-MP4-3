@echo off
title Video & Audio Downloader - yt-dlp
color 0A

:: Output folder = Desktop
set "OUTPUT_DIR=%USERPROFILE%\Desktop"

:MENU
cls
echo ========================================
echo   VIDEO & AUDIO DOWNLOADER (yt-dlp)
echo ========================================
echo.
echo 1. Download Video (MP4 - best quality)
echo 2. Download Audio (MP3 - 320kbps)
echo 3. Exit
echo.
set /p choice=Select an option [1-3]: 

if "%choice%"=="1" goto VIDEO
if "%choice%"=="2" goto AUDIO
if "%choice%"=="3" exit
goto MENU

:VIDEO
cls
set /p url=Enter the video URL: 
yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" --merge-output-format mp4 -o "%OUTPUT_DIR%\%%(title)s.%%(ext)s" "%url%"
echo.
echo [DONE] Video download complete. Saved to Desktop.
pause
goto MENU

:AUDIO
cls
set /p url=Enter the video URL: 
yt-dlp -f "bestaudio" --extract-audio --audio-format mp3 --audio-quality 0 -o "%OUTPUT_DIR%\%%(title)s.%%(ext)s" "%url%"
echo.
echo [DONE] Audio download complete. Saved to Desktop.
pause
goto MENU
