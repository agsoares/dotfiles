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

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.fastlane/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

fortune | cowsay | lolcat
