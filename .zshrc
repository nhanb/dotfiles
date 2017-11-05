# Obligatory oh-my-zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nhanb"
plugins=(git virtualenv)
source $ZSH/oh-my-zsh.sh

if [ -f $HOME/dotfiles/globalrc ]; then
   source $HOME/dotfiles/globalrc
fi

export MYVIM="full"  # install all plugins, including the non-trivial ones too
alias mountPhone='go-mtpfs /media/MyAndroid'
alias unmountPhone='fusermount -u /media/MyAndroid'
alias tm=tmuxinator
alias histgrep='cat ~/.zsh_history | grep'
alias devchrome="google-chrome-stable --user-data-dir=\"$HOME/tmp/chrome_dev_session\" --disable-web-security"
alias pserve='python2 -m SimpleHTTPServer'
alias pshow='pass show -c'
alias zipdirs='for i in */; do zip -r "${i%/}.zip" "$i"; done'
alias cbzdirs='for i in */; do zip -r "${i%/}.cbz" "$i"; done'

# Pipenv quality-of-life stuff
alias per='pipenv run'
alias pea='source `pipenv --venv`/bin/activate'

# Google App Engine (Python WTF!)
export GAE_PATH="$HOME/google_appengine"
alias gaecfg="python2 $GAE_PATH/appcfg.py --oauth2"
alias gaeserv="python2 $GAE_PATH/dev_appserver.py"
alias gdeploy='gaecfg update . && notify-send -u critical -i "/home/nhanb/myicons/gae.png" "GAE Deployed"'
alias gserve='gaeserv .'

# virtualenv
export WORKON_HOME=$HOME/virtualenvs
if [ "$PIPENV_ACTIVE" != '1' ]; then
    if [[ "`uname -r`" == *-ARCH ]]; then
        [ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh
    else
        [ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
    fi
fi


# Quality-of-life helpers for python3's venv:
mkvenv() {
    python3 -m venv "$HOME/.venvs/$1"
}
actvenv() {
    local VENV_BIN="$HOME/.venvs/$1/bin/activate"
    if [ -f "$VENV_BIN" ]; then
        source "$VENV_BIN"
    else
        echo "$fg[red]$VENV_BIN doesn't exists!"
    fi
}

export PATH=$PATH:$HOME/.rvm/bin
[ -f /home/nhanb/.travis/travis.sh ] && source /home/nhanb/.travis/travis.sh
export PATH=$PATH:$HOME/.cabal/bin

# Helper function: prepend into PATH if not already in there
pupdate() { case ":${PATH:=$1}:" in *:$1:*) ;; *) PATH="$1:$PATH" ;; esac; }
if type ruby > /dev/null; then
    local GEM_BIN=$(ruby -rubygems -e "puts Gem.user_dir")/bin
    pupdate $GEM_BIN
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[[ -s "/home/nhanb/.gvm/scripts/gvm" ]] && source "/home/nhanb/.gvm/scripts/gvm"

# Command to open man page via vim
# https://github.com/Z1MM32M4N/vim-superman
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

# Rails crap
alias brails='./bin/rails'
alias brake='./bin/rake'

# GitHub's hub
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

# Vagrant
alias vag='vagrant'

# lol http://docs.ansible.com/ansible/faq.html#how-do-i-disable-cowsay
export ANSIBLE_NOCOWS=1

# I install lektor here
export PATH="$PATH:$HOME/.local/bin"

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
