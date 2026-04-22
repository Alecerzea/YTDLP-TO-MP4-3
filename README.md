# YTDLP-TO-MP4-3
Some Script that you can simply launch from cmd and powershell to download any video using ytdlp and choose if you want to keep it as a video or turn it into an Audio

yt-dlp --cookies-from-browser firefox -f "bv*[height=1080]+ba/b[height=1080][ext=mp4]" --merge-output-format mp4

yt-dlp -x --audio-format mp3
