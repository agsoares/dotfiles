
if [ "$(uname)" == "Darwin" ]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Install Brewfile
    if which brew  > /dev/null; then brew bundle; fi
fi

# Backup old .zshrc and symlink the new one
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bkp-$(date +%m.%d.%y.%s)
fi
ln -s .zshrc ~/.zshrc

# Backup old .gitconfig and symlink the new one
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.bkp-$(date +%m.%d.%y.%s)
fi
ln -s .gitconfig ~/.gitconfig

# Backup old .gitignore_global and symlink the new one
if [ -f ~/.gitignore_global ]; then
    mv ~/.gitignore_global ~/.gitignore_global.bkp-$(date +%m.%d.%y.%s)
fi
ln -s .gitignore_global ~/.gitignore_global