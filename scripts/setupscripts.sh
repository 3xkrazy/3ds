#!/bin/bash
# setupscripts

dir_bin=~/.bin/
homebrew_url=https://raw.githubusercontent.com/3xkrazy/3ds/master/scripts/homebrew.sh;
nandtool_url=https://raw.githubusercontent.com/3xkrazy/3ds/master/scripts/nandtool.sh;
funkeycia_url=https://raw.githubusercontent.com/3xkrazy/3ds/master/scripts/funkeycia.sh;
funkeycia=https://raw.githubusercontent.com/llakssz/FunKeyCIA/master/FunKeyCIA.py;
setaudio_url=https://raw.githubusercontent.com/3xkrazy/bash_scripts/master/system/setaudio.sh;
pmove_url=https://raw.githubusercontent.com/3xkrazy/bash_scripts/master/system/pmove.sh;

rm -v $dir_bin/homebrew.sh;
rm -v $dir_bin/nandtool.sh;
rm -v $dir_bin/funkeycia.sh;
rm -v $dir_bin/FunKeyCIA.py;
rm -v $dir_bin/setaudio.sh;
rm -v $dir_bin/pmove.sh;

cd $dir_bin;

wget $homebrew_url;
wget $nandtool_url;
wget $funkeycia_url;
wget $funkeycia;
wget $setaudio_url;
wget $pmove_url;

chmod -v u+x $dir_bin/homebrew.sh;
chmod -v u+x $dir_bin/nandtool.sh;
chmod -v u+x $dir_bin/funkeycia.sh;
chmod -v u+x $dir_bin/FunKeyCIA.py;
chmod -v u+x $dir_bin/setaudio.sh;
chmod -v u+x $dir_bin/pmove.sh;
