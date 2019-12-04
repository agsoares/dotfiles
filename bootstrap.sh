symlink_file() {
    FILE=$1 
    if [ -e ~/$FILE ]; then
        # Backup old file
        mv ~/$FILE ~/$FILE.bkp-$(date +%m.%d.%y.%s)
    fi
    # Symlink new file
    ln -s ~/.dotfiles/$FILE ~/$FILE 
}

if [ "$(uname)" == "Darwin" ]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Install Brewfile
    if which brew  > /dev/null; then brew bundle; fi
fi

symlink_file .zshrc
symlink_file .npmrc
symlink_file .gitconfig
symlink_file .gitignore_global

ZSH=$(which zsh)
if ! grep -q $ZSH /etc/shells; then
  #Add zsh to your shells
  sudo echo $ZSH >> /etc/shells
fi
#Make zsh the default shell
chsh -s $ZSH