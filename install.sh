#!/bin/sh

sudo apt-get install build-essential ruby ruby-dev rsync
git submodule update --init --recursive
git submodule update --recursive --remote
echo "[!] python-mode should be installed separately as it uses submodules itself"
cd ./.vim/bundle/
git clone --recurse-submodules https://github.com/python-mode/python-mode.git
cd -
mkdir ./.vim/undodir
mkdir -p ./.vim/tmp/backup
mkdir -p ./.vim/tmp/swap
rsync -avz --exclude-from=./.rsync_exclude ./ ~/
rsync -avz --delete ./.vim/bundle/ ~/.vim/bundle/
rsync -avz --delete ./.oh-my-zsh/custom/ ~/.oh-my-zsh/custom/
echo "Sudo for apt-get various buld packages"
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t/
make clean; ruby extconf.rb && make
cd -
rm -rf ./.vim/bundle/python-mode/
