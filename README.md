dotfiles
========

Clone this to a target host e.g. to ~/dotfiles and run install.sh.
It will update submodules and rsync everything to ~/, ~/.vim/bundle/ and ~/.oh-my-zsh/custom directories.
**Warning!** It will **delete** all exsting files in two last dirs i.e. rsync runned with --delete option for them.
