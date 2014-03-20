echo "Setting up vim"

cd ~/dotfiles/.vim/

# Clone vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# For Ubuntu or Debian-based systems only
read -p "\nDo you want to install clang & exuberant-ctags (y/n)? " answer
if [ $answer == "y" ]; then
    sudo apt-get install clang exuberant-ctags
fi

# Fetch vim plugins
read -p "\nShould we start vim and pull plugins for you too (y/n)? " answer
if [ $answer == "y" ]; then
    vim -c 'BundleInstall'
else
    echo "Done."
fi
