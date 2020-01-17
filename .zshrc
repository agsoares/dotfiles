# Bundles configuration
BUNDLED_COMMANDS=(pod fastlane)

# .zshrc Source Basic
if [ "$(uname)" = "Darwin" ]; then
    source /usr/local/share/antigen/antigen.zsh
else
    source /usr/share/zsh-antigen/antigen.zsh
    
    unsetopt BG_NICE

    # Change ls colors
    LS_COLORS="ow=01;36;40" && export LS_COLORS

    # Make cd use the ls colors
    zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
    autoload -Uz compinit
    compinit
fi
antigen init ~/.dotfiles/.antigenrc

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "[D" backward-word
bindkey "[C" forward-word

DISABLE_AUTO_TITLE="true"

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

if which brew  > /dev/null; then 
    export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH
    
    export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

test -e ~/.dotfiles/.aliases && source ~/.dotfiles/.aliases # Source aliases
test -e ~/.dotfiles/.zshrc.local  && source ~/.dotfiles/.zshrc.local # Source local configs

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"