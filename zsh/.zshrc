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

# nvm 
source /usr/share/nvm/init-nvm.sh

# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Auto-start tmux in Alacritty
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    if [ -n "$ALACRITTY_SOCKET" ] || [ -n "$GHOSTTY_RESOURCES_DIR" ]; then
        exec tmux new-session -A -s main
    fi
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
