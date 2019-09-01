if [ "$(uname)" == "Darwin" ]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Install Brewfile
    if which brew  > /dev/null; then brew bundle; fi
fi

# Backup old .zshrc and symlink the new one
if [ -e ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bkp-$(date +%m.%d.%y.%s)
fi
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Backup old .gitconfig and symlink the new one
if [ -e ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.bkp-$(date +%m.%d.%y.%s)
fi
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# Backup old .gitignore_global and symlink the new one
if [ -e ~/.gitignore_global ]; then
    mv ~/.gitignore_global ~/.gitignore_global.bkp-$(date +%m.%d.%y.%s)
fi
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global

ZSH=$(which zsh)
if ! grep -q $ZSH /etc/shells; then
  #Add zsh to your shells
  sudo echo $ZSH >> /etc/shells
fi
#Make zsh the default shell
chsh -s $ZSH