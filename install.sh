#!/bin/sh

rsync -avz --exclude-from=./.rsync_exclude ./ ~/
apt-get install build-essential ruby
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd -