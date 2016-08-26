#!/bin/sh

git submodule update --init --recursive
mkdir ./.vim/undodir
mkdir -p ./.vim/tmp/backup
mkdir -p ./.vim/tmp/swap
rsync -avz --exclude-from=./.rsync_exclude ./ ~/
rsync -avz --delete ./.vim/bundle/ ~/.vim/bundle/
rsync -avz --delete ./.oh-my-zsh/custom/ ~/.oh-my-zsh/custom/
sudo apt-get install build-essential ruby ruby-dev
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd -
