export XDG_CONFIG_HOME="$HOME/.config"
bindkey '^L' vi-forward-word
bindkey '^H' vi-backward-word
bindkey jj vi-cmd-mode

# If nvim is installed alias vi and v to it and make it default editor
if command -v nvim &>/dev/null; then
  export EDITOR=$(brew --prefix)/bin/nvim
  alias vi='nvim'
  alias v='nvim'
fi

# bat alias for cat if installed
command -v bat &>/dev/null && alias cat='bat'

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git --all"
alias ltree="eza --tree --level=2  --icons --git --all"
alias ltf="eza --tree --icons --git --all"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# Git
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
# -> need to migrate it into function
alias gpsup="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gadd='git add'
alias ga='git add -p'

# Yazi cwd and shortcut
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

source "$HOME/.local.zshrc"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
