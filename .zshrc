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

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

fortune | cowsay | lolcat

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

