
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Bundles configuration
# BUNDLED_COMMANDS=(pod fastlane)

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

# .zshrc Source Basic
source <(antibody init)

unsetopt BG_NICE

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Change ls colors
# LS_COLORS="ow=01;36" && export LS_COLORS

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

export LESS=-R

# Make cd use the ls colors
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always --icons=never $realpath | head -200'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --color=always --icons=never $realpath | head -200'

antibody bundle < "${DOTFILES}/.antibodyrc"

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "[D" backward-word
bindkey "[C" forward-word

DEBIAN_PREVENT_KEYBOARD_CHANGES=yes
DISABLE_AUTO_TITLE="true"

include () { [ -f "$1" ] && source "$1" || true }

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

which rbenv > /dev/null && eval "$(rbenv init - zsh)"
which pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

include "${DOTFILES}/zsh/.fzf"

include "${DOTFILES}/zsh/.aliases"
include "${DOTFILES}/zsh/.functions"

include "${DOTFILES}/.zshrc.local"

which zoxide > /dev/null && eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
