#!/bin/sh

cd `dirname $0`

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/dein
rm /tmp/installer.sh

ln -s `pwd`/.vimrc ~/.vimrc
mkdir -p ~/.vim
ln -s `pwd`/ftplugin ~/.vim/ftplugin
