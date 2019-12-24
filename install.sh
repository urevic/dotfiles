#!/bin/sh

git submodule update --init --recursive
git submodule update --recursive --remote
mkdir ./.vim/undodir
mkdir -p ./.vim/tmp/backup
mkdir -p ./.vim/tmp/swap
rsync -avz --exclude-from=./.rsync_exclude ./ ~/
rsync -avz --delete ./.vim/bundle/ ~/.vim/bundle/
rsync -avz --delete ./.oh-my-zsh/custom/ ~/.oh-my-zsh/custom/
echo "Sudo for apt-get various buld packages"
sudo apt-get install build-essential ruby ruby-dev
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/
make clean; ruby extconf.rb && make
cd -
