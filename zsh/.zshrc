


export EDITOR=$(brew --prefix)/bin/nvim


source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^L' vi-forward-word
bindkey '^H' vi-backward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

eval "$(starship init zsh)"
