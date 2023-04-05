# No throttle Download
```
sudo apt install -y ffmpeg aria2 youtube-dl

alias ydl='youtube-dl -f best --external-downloader "aria2c" --external-downloader-args "-j 10 -x 10 -s 10 -k 10M"'

gupl(){
  if [ -z ${1+x} ]; then 
    echo "USAGE: gupl ./folder GDUP:JUNK/NEW"
  else
    for EXT in "$1"; do rclone copy "$PWD"/"$EXT" "$2" -P; done
  fi
}
```
