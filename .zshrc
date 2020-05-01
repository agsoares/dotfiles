# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Bundles configuration
BUNDLED_COMMANDS=(pod fastlane)

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

# .zshrc Source Basic
source <(antibody init)

unsetopt BG_NICE

# Change ls colors
LS_COLORS="ow=01;36" && export LS_COLORS

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

export LESS=-R

# Make cd use the ls colors
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive auto completion
zstyle ':completion:*' menu yes select

antibody bundle < "${DOTFILES}/.antibodyrc"

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "[D" backward-word
bindkey "[C" forward-word

DISABLE_AUTO_TITLE="true"

include () { [ -f "$1" ] && source "$1" }

which rbenv > /dev/null && eval "$(rbenv init - zsh)"
which pyenv > /dev/null && eval "$(pyenv init - --no-rehash zsh)" && eval "$(pyenv virtualenv-init -)"

include "${HOME}/.iterm2_shell_integration.zsh" 

include "${DOTFILES}/zsh/.aliases"
include "${DOTFILES}/zsh/.functions"

include "${DOTFILES}/.zshrc.local"
