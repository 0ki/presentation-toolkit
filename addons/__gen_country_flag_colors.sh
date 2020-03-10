#!/bin/bash

# Note that Monaco and Indonesia have the same flags (2020) and will result in the same colour

set -e
mkdir tmp1
cd tmp1
wget -q https://flagpedia.net/data/flags/h240.zip -O h240.zip
unzip -q h240.zip
wget -q https://flagpedia.net/download/filenames-format-png.json -O decode.json
rm h240.zip
echo 'intellicolors.update ({'
for x in `ls -1 *.png`; do
  c1="$(cat decode.json | grep "\"$x\"" | cut -d : -f 2-|cut -d \" -f 2 | sed "s/'/\\\'/g" )"
  c2="$(convert $x -scale 1x1 - | dominantcolor -)"
  echo "'$c1': '#$c2'",
done
echo '})'
cd ..
rm tmp1 -r
