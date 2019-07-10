if [ -n "$DISPLAY" -a "$TERM" = "xterm" ]; then
    export TERM=xterm-256color
fi
export WORKON_HOME=/home/venv

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="blinks"
#ZSH_THEME="agnoster"
ZSH_THEME="dst"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:ll:cd:cd -:pwd:exit:date:* --help";

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found history-substring-search debian dirpersist extract zsh-syntax-highlighting virtualenvwrapper tmux colored-man-pages common-aliases python pip z bgnotify)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
setopt hist_ignore_space
eval `dircolors ~/.dir_colors`
DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
ZSH_TMUX_AUTOCONNECT=true
