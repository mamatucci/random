## get the extension
# https://addons.mozilla.org/en-US/firefox/addon/export-cookies/

# login
# https://www.safaribooksonline.com/accounts/login/?next=/s/

## export the cookies


cd ~
mkdir -p crawler
cd crawler

#ex for 9781783558964
mkdir 9781783558964
cd 9781783558964
wget --load-cookies=../cookies.txt  -mkEpnp  https://www.safaribooksonline.com/library/view/cloudera-administration-handbook/9781783558964/

