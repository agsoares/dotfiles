# .zshrc Source Basic
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle brew
antigen bundle osx

# Third Party
antigen bundle kennethreitz/autoenv

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle paulirish/git-open

antigen bundle mafredri/zsh-async
antigen theme DFurnes/purer

# Tell antigen that you're done.
antigen apply

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function random_word() {
    perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n'
}

function mailinator() {
    W1=$(random_word)
    W2=$(random_word)
    echo $W1$W2'@mailinator.com' | pbcopy
    open 'http://www.mailinator.com/v2/inbox.jsp?zone=public&query='$W1$W2 -a /Applications/Opera.app
}

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.fastlane/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

fortune | cowsay | lolcat
