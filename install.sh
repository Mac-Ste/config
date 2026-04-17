#!/bin/bash

check_or_install() {
  local pkg="$1"
  local info

  if [ -z "$pkg" ]; then
    echo "Usage: check_brew <package>"
    return 1
  fi

  # Try formula
  info=$(brew list --versions "$pkg" 2>/dev/null)

  # If empty, try cask
  if [ -z "$info" ]; then
    info=$(brew list --cask --versions "$pkg" 2>/dev/null)
  fi

  if [ -n "$info" ]; then
    echo "$pkg already installed, version: ${info#* }"
  else
    echo "$pkg is not installed. Installing..."
    brew install --cask "$pkg" 2>/dev/null || brew install "$pkg"
  fi
}

check_or_install tmux

check_or_install neovim

# yazi with dependencies: https://yazi-rs.github.io/docs/installation
check_or_install yazi
check_or_install fzf
check_or_install 7zip
check_or_install ffmpeg
check_or_install jq
check_or_install poppler
check_or_install fd
check_or_install rg
check_or_install zoxide
check_or_install resvg
check_or_install imagemagick
check_or_install ghostscript

check_or_install ghostty

check_or_install asmvik/formulae/skhd
check_or_install stow

stow */
tmux source-file ~/tmux.conf
