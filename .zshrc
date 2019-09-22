# Bundles configuration
BUNDLED_COMMANDS=(pod fastlane)
AM_PROMPT_END_TAG=' %F{red}❯%F{yellow}❯%F{green}❯%f'
AM_INITIAL_LINE_FEED=1
AM_THEME=default
AM_HIDE_EXIT_CODE=1

# .zshrc Source Basic
source /usr/local/share/antigen/antigen.zsh
antigen init ~/.antigenrc

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "[D" backward-word
bindkey "[C" forward-word

DISABLE_AUTO_TITLE="true"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

if which brew  > /dev/null; then export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -f "$(brew --prefix)/etc/profile.d/z.sh" ] && source "$(brew --prefix)/etc/profile.d/z.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e ~/.dotfiles/.aliases && source ~/.dotfiles/.aliases
