#export PIP_REQUIRE_VIRTUALENV=true
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
source ~/z.sh

alias gdc="git diff --cached"
alias dco="docker-compose"
alias doc="docker-compose"
alias dm="docker-machine"
alias bower='noglob bower'
# The removed Zsh git alias
alias gdc="gd --cached"

export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="emacsclient -c"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load zgen
source ~/zgen/zgen.zsh

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    zgen load zsh-users/zsh-syntax-highlighting
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/tmux

    zgen oh-my-zsh themes/agnoster
    # save all to init script
    zgen save
fi

export ZSH_TMUX_AUTOSTART=true
export DEFAULT_USER=syndbg

export ANDROID_HOME=~/Library/Android/sdk
export GOPATH=~/gocode
export GOROOT=/usr/local/opt/go/libexec

PATH="$PATH:/usr/local/sbin/:$GOPATH/bin:$GOROOT/bin:$HOME/.cabal/bin"
PATH="$HOME/.jenv/bin:$PATH"
export PATH="$PATH:$HOME/npm/bin:$HOME/.rbenv/bin:$ANDROID_HOME/platform-tools"

# Version managers
export JENV_ROOT=/usr/local/var/jenv
eval "$(jenv init -)"
eval "$(rbenv init -)"
export NVM_DIR="/Users/syndbg/.nvm"
. ~/.nvm/nvm.sh

# Tell `docker` to use `docker-machine`. Deprecated `boot2docker`.
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="/Users/syndbg/.docker/machine/machines/dev"
# export DOCKER_MACHINE_NAME="dev"
# Run this command to configure your shell:
# eval "$(docker-machine env dev)"

# Ruby optimizations
# http://labs.goclio.com/tuning-ruby-garbage-collection-for-rspec/
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_GC_HEAP_INIT_SLOTS=2000000

