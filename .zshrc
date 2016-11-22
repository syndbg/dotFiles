#export PIP_REQUIRE_VIRTUALENV=true
export WORKON_HOME=$HOME/.virtualenvs
source ~/z.sh

alias gdc="git diff --cached"
alias doc="docker"
alias docp="docker-compose"
alias docm="docker-machine"
alias dom="docker-machine"
alias bower='noglob bower'
# The removed Zsh git alias
alias gdc="gd --cached"
alias gsho="git show"
alias gcan="gc --amend --no-edit"
alias va="vagrant"
alias ans="ansible"
alias ansp="ansible-playbook"
alias ansg="ansible-galaxy"
alias ansv="ansible-vault"
alias ansl="ansible-lint"
alias mnk="minikube"

export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="vim"

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

# Load antigen
source "${HOME}/antigen.zsh"
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle bundler
antigen bundle command-not-found
antigen bundle docker
antigen bundle git
antigen bundle gitfast
antigen bundle npm
antigen bundle osx
antigen bundle sudo
antigen bundle tmux
antigen theme robbyrussell
# Tell antigen that you're done.
antigen apply

export ZSH_TMUX_AUTOSTART=true
export DEFAULT_USER=syndbg

export ANDROID_HOME=~/Library/Android/sdk
export GOPATH=~/gocode
PATH="$PATH:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:$HOME/.cabal/bin"
# PATH="$HOME/.jenv/bin:$PATH"
export PATH="$PATH:$HOME/npm/bin:$HOME/.rbenv/bin:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/.pyenv/bin"

# Version managers
# export JENV_ROOT=/usr/local/var/jenv
export GOENV_ROOT="$HOME/.goenv"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$GOENV_ROOT/bin:$PYENV_ROOT/bin:$PATH/"
eval "$(goenv init -)"
# eval "$(jenv init -)"
eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper_lazy
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Ruby optimizations
# http://labs.goclio.com/tuning-ruby-garbage-collection-for-rspec/
export RUBY_HEAP_MIN_SLOTS=2000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_GC_HEAP_INIT_SLOTS=2000000
export GTAGSLABEL=pygments
# Use default docker machine
eval "$(docker-machine env default)"
export DOCKER_HOST_IP=$(docker-machine ip)

update-docker-hosts(){
    # clear existing *.docker.local entries from /etc/hosts
    sudo sed -i '' '/\.docker\.local$/d' /etc/hosts

    # iterate over each machine
    docker-machine ls | tail -n +2 | awk '{print $1}' \
        | while read -r MACHINE; do
        MACHINE_IP="$(docker-machine ip ${MACHINE} 2>/dev/null)"
        [[ -n $MACHINE_IP ]] && sudo /bin/bash -c "echo \"${MACHINE_IP}	${MACHINE}.docker.local\" >> /etc/hosts"
        export no_proxy=$no_proxy,$MACHINE_IP
    done
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/syndbg/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/syndbg/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/syndbg/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/syndbg/google-cloud-sdk/completion.zsh.inc'
fi

source <(kubectl completion zsh)
