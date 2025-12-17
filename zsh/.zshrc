export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'
alias vim="nvim"
alias uxplay="uxplay -vs autovideosink -n "iPad Screen""

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups

# nvm - lazy load (only initialize when node/npm/nvm is called)
export NVM_DIR="/usr/share/nvm"
nvm() {
    unset -f nvm node npm
    source "$NVM_DIR/init-nvm.sh"
    nvm "$@"
}
node() {
    unset -f nvm node npm
    source "$NVM_DIR/init-nvm.sh"
    node "$@"
}
npm() {
    unset -f nvm node npm
    source "$NVM_DIR/init-nvm.sh"
    npm "$@"
}

# pyenv - cache init for faster startup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
PYENV_CACHE="$HOME/.cache/pyenv-init.zsh"
if command -v pyenv 1>/dev/null 2>&1; then
  # Regenerate cache if older than 1 hour or doesn't exist
  if [[ ! -f "$PYENV_CACHE" ]] || [[ -n $(find "$PYENV_CACHE" -mmin +60 2>/dev/null) ]]; then
    mkdir -p "$(dirname "$PYENV_CACHE")"
    pyenv init - > "$PYENV_CACHE"
  fi
  source "$PYENV_CACHE"
fi

# Auto-start tmux in Alacritty
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    if [ -n "$ALACRITTY_SOCKET" ] || [ -n "$GHOSTTY_RESOURCES_DIR" ]; then
        tmux new-session -A -s main
    fi
fi

# Homebrew - cache shellenv for faster startup
BREW_CACHE="$HOME/.cache/brew-shellenv.zsh"
if [[ ! -f "$BREW_CACHE" ]] || [[ -n $(find "$BREW_CACHE" -mmin +60 2>/dev/null) ]]; then
    mkdir -p "$(dirname "$BREW_CACHE")"
    /home/linuxbrew/.linuxbrew/bin/brew shellenv > "$BREW_CACHE"
fi
source "$BREW_CACHE"

# Performance optimizations - disable animations system-wide
export QT_STYLE_OVERRIDE=gtk2
export GTK_ENABLE_ANIMATIONS=0
export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_THEME=Arc-Dark
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Arc-Dark
export QT_QPA_PLATFORMTHEME=qt5ct

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
