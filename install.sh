#!/bin/sh

git submodule update --init
rsync -avz --exclude-from=./.rsync_exclude ./ ~/
rsync -avz ./.vim/bundle/ ~/.vim/bundle/
rsync -avz ./.oh-my-zsh/custom/ ~/.oh-my-zsh/custom/
apt-get install build-essential ruby ruby-dev
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd -
