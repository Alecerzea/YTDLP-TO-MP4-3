@echo off
REM Verificar si yt-dlp está instalado
where yt-dlp >nul 2>&1
if errorlevel 1 (
    echo [!] yt-dlp not installed, trying to install it with pip...
    python -m pip install -U yt-dlp
    if errorlevel 1 (
        echo [X] Error.
        exit /b 1
    )
)

REM Solicitar URL
set /p mediaURL=Enter media URL: 
set /p type=Is this a video or audio? (v/a): 

REM Obtener timestamp
for /f "tokens=1" %%a in ('powershell -Command "(Get-Date -UFormat %%s)"') do set timestamp=%%a
set filename=download_%timestamp%

REM Descargar
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
