# Obligatory oh-my-zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nhanb"
plugins=(git virtualenv docker)
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
[ -f /etc/profile.d/rvm.sh ] && source /etc/profile.d/rvm.sh

[ -f /home/nhanb/.travis/travis.sh ] && source /home/nhanb/.travis/travis.sh
export PATH=$PATH:$HOME/.cabal/bin

# Helper function: prepend into PATH if not already in there
pupdate() { case ":${PATH:=$1}:" in *:$1:*) ;; *) PATH="$1:$PATH" ;; esac; }
if type ruby > /dev/null; then
    local GEM_BIN=$(ruby -e "puts Gem.user_dir")/bin
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

# Pipenv quality-of-life stuff
alias peactivate='source `pipenv --venv`/bin/activate'
alias perun='pipenv run'
alias pepy='pipenv run python'

# Pyenv
export PATH="/home/nhanb/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


##############################
# Parcel Perform:
##############################

ppsu () {
    if [ -z "$1" ]; then
        container="parcelperform_${PWD##*/}_1"
    else
        container=parcelperform_pp_"$1"_1
    fi
    docker exec -it $container su $2
}
ppshell () {
    ppsu "$1" '-c ./manage.py shell'
}
pprestart () {
    docker restart parcelperform_pp_"$1"_1
}
ppbuildjs () {
    docker exec -it parcelperform_pp_"$1"_1 ./dockerbuild/bundle_js.sh
}

# First run only. Subsequently you can just `docker start <container_name>`
pprun () {
    docker run -d --name pp_"$1"_dev --env-file=./env_files/local_pp.env -v $PWD:/srv/pp_"$1" -v $PWD/../logs:/srv/logs parcelperform/pp_"$1":master
}
pp-scraper-start () {
    docker run -d --name pp_scraper_dev\
        --env-file=./env_files/local_pp.env\
        -v $PWD:/srv/pp_scraper\
        -v $PWD/../logs:/srv/logs\
        parcelperform/pp_scraper:master
}
pp-scraper-test () {
    docker exec -it parcelperform_pp_hp_scraper_1 python -m unittest tests.test_scrapers."$1"
}
ppdev() {
    docker exec -it pp_"$1"_dev su $2
}

ppup() {
    cd ~/parcel/parcel-perform
    docker-compose -f docker-compose-infra.yml up -d
    sleep 1m
    docker-compose up -d
    docker ps
}

ppstop() {
    cd ~/parcel/parcel-perform
    docker-compose stop
    sleep 5s
    docker-compose -f docker-compose-infra.yml stop
    docker ps
}

ppactivate() {
    pyenv activate ${PWD##*/}
}

ppkill() {
    docker exec -it "parcelperform_${PWD##*/}_1" su '-c killall -9 python'
}
