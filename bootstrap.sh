symlink_file() {
    FILE=$1 
    if [ -e ~/$FILE ]; then
        # Backup old file
        mv ~/$FILE ~/$FILE.bkp-$(date +%m.%d.%y.%s)
    fi
    # Symlink new file
    ln -s ~/.dotfiles/$FILE ~/$FILE 
}

if [ "$(uname)" = "Darwin" ]; then
    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Hombrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Updating Homebrew"
        brew update
    fi

    echo "Install Brewfile"
    brew bundle
fi

symlink_file .vim
symlink_file .zshrc
symlink_file .amrc
symlink_file .npmrc
symlink_file .gitconfig
symlink_file .gitignore_global