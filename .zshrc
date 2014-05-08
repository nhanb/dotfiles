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

# Google App Engine (Python WTF!)
export GAE_PATH="$HOME/google_appengine"
alias gaecfg="python2 $GAE_PATH/appcfg.py --oauth2"
alias gaeserv="python2 $GAE_PATH/dev_appserver.py"
alias gdeploy='gaecfg update . && notify-send -u critical -i "/home/nhanb/myicons/gae.png" "GAE Deployed"'
alias gserve='gaeserv .'

# virtualenv
export WORKON_HOME=$HOME/virtualenvs
source /usr/bin/virtualenvwrapper.sh

export PATH=$PATH:$HOME/.rvm/bin
[ -f /home/nhanb/.travis/travis.sh ] && source /home/nhanb/.travis/travis.sh
export PATH=$PATH:$HOME/.cabal/bin
source ~/.nvm/nvm.sh
