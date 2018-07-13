# .zshrc Source Basic
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles configuration
BUNDLED_COMMANDS=(pod fastlane)

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle brew
antigen bundle osx
antigen bundle bundler

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

if which brew  > /dev/null; then export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -f "$(brew --prefix)/etc/profile.d/z.sh" ] && source "$(brew --prefix)/etc/profile.d/z.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.dotfiles/.aliases

fortune | cowsay | lolcat