
if [ "$(uname)" == "Darwin" ]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if which brew  > /dev/null; then brew bundle; fi
fi

