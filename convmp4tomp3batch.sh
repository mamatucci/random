###
# obar1 extract mp4 to mp3 in batch
##
#> static build (if u r not root) https://johnvansickle.com/ffmpeg/

params1="-q:a 0 -map a"
params2="-vn -ar 44100 -ac 2 -ab 192k -f mp3"

params=$params2

find ./mp4 -type f -name '*.mp4' -print0 | 
while IFS= read -r -d '' file; do
    printf '%s\n' "$file"
    ./ffmpeg-3.4-64bit-static/ffmpeg -y -i "$file" $params "${file}.mp3";
done


