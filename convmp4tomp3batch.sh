# obar1 2017-11
# @@@ extract mp4 to mp3 in batch via mpeg

# > note you can get file from shared dropfolder   
# curl -L https://www.dropbox.com/sh/6qchq16vzkfp98z/AAB6v7o9XwDFFhtaSbN1q7dWa?dl=1 > mp4.zip ; unzip mp4.zip
#extract option
params1="-q:a 0 -map a"
params2="-vn -ar 44100 -ac 2 -ab 192k -f mp3"

#runtime params
params=$params2
targetFolder="./mp4"

find $targetFolder -name "*.mp4" -print0 |
sed -e "s/.mp4//g"  |
while read -d $'\0' file; do
   ./ffmpeg-3.4-64bit-static/ffmpeg -y -i "$targetFolder/$file.mp4" $params "$targetFolder/$file.mp3" < /dev/null;
done

du $targetFolder/*.mp3 -h

~                                                                                                                                                              
~                                 
