# https://manual.calibre-ebook.com/generated/en/ebook-convert.html

```
rm *.pdf -f
export options='--output-profile=ipad3 --paper-size=legal --pretty-print  --toc-title  --uncompressed-pdf --pdf-add-toc --pdf-default-font-size=10 --pdf-page-numbers --pdf-mark-links'

array=( 9781484235799 9781484236529 9781491912201 9781491943199 9781785885006 9781787125162 )

for i in "${array[@]}"
do
   echo *** $i
   nohup ebook-convert $i.epub $i.pdf  $options & 
done



```


