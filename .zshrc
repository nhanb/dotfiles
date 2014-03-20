# Obligatory oh-my-zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nhanb"
plugins=(git virtualenv virtualenvwrapper zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

if [ -f $HOME/dotfiles/globalrc ]; then
   source $HOME/dotfiles/globalrc
fi

export GAE_PATH="$HOME/google_appengine"
export MYVIM="full"  # install all plugins, including the non-trivial ones too
alias mountPhone='go-mtpfs /media/MyAndroid'
alias unmountPhone='fusermount -u /media/MyAndroid'

# Google App Engine (Python WTF!)
alias gaecfg='python2 ~/google_appengine/appcfg.py --oauth2'
alias gaeserv='env http_proxy="" https_proxy="" all_proxy="" python2 ~/google_appengine/dev_appserver.py'
alias gdeploy='gaecfg update . && notify-send -u critical -i "/home/nhanb/myicons/gae.png" "GAE Deployed"'
alias gserve='gaeserv .'

# virtualenv
export WORKON_HOME=$HOME/virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh
alias v='workon'
alias v.de='deactivate'
alias v.mk='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$HOME/google_appengine
[ -f /home/nhanb/.travis/travis.sh ] && source /home/nhanb/.travis/travis.sh
