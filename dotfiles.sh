#!/bin/bash

# Script to install .vimrc and .tmux.conf from GitHub Gists

# --- Configuration ---
VIM_GIST_URL="git@gist.github.com:aa74a563d2c0f67fef9a437b413ada2b.git"
TMUX_GIST_URL="git@gist.github.com:0b9581e8ccc3fef4ec50.git"
ALIASES_VPN_GIST_URL="git@gist.github.com:8ad5e69faf6458a86f7cb7a49e52b076.git"
DOTFILES_DIR="$HOME/git/.dotfiles"

# --- Functions ---
create_dotfiles_dir() {
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Creating $DOTFILES_DIR"
    mkdir -p "$DOTFILES_DIR"
  else
    echo "$DOTFILES_DIR already exists."
  fi
}

clone_gist() {
  local gist_url="$1"
  local target_dir="$2"

  if [ -z "$gist_url" ] || [ -z "$target_dir" ]; then
    echo "Error: gist_url or target_dir is empty."
    return 1
  fi

  if [ -d "$target_dir" ]; then
      echo "$target_dir already exists. Pulling changes"
      git -C "$target_dir" pull origin main 2>/dev/null || git -C "$target_dir" pull origin master 2>/dev/null
  else
    echo "Cloning $gist_url into $target_dir"
    git clone "$gist_url" "$target_dir"
  fi
}

create_symlinks() {
  local source_file="$1"
  local target_file="$2"

  if [ -z "$source_file" ] || [ -z "$target_file" ]; then
    echo "Error: source_file or target_file is empty."
    return 1
  fi

  if [ -L "$target_file" ]; then
    echo "Symbolic link $target_file already exists."
  elif [ -e "$target_file" ]; then
    echo "File $target_file exists, but is not a symbolic link. Please remove it and re-run the script."
    return 1;
  else
    echo "Creating symbolic link: $target_file -> $source_file"
    ln -s "$source_file" "$target_file"
  fi
}

# --- Main Script ---
create_dotfiles_dir

# Clone Gist(s)
clone_gist "$VIM_GIST_URL" "$DOTFILES_DIR/vim"
clone_gist "$TMUX_GIST_URL" "$DOTFILES_DIR/tmux"
clone_gist "$ALIASES_VPN_GIST_URL" "$DOTFILES_DIR/aliases_vpn"

# Create symbolic links
create_symlinks "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
create_symlinks "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
create_symlinks "$DOTFILES_DIR/aliases_vpn/aliases_vpn" "$HOME/.bashrc.d/aliases_vpn"

echo "Dotfiles installation complete!"
echo "If you made changes to your .tmux.conf file, run: tmux source-file ~/.tmux.conf"
echo "If you made changes to your .vimrc file, restart vim, or run: :source ~/.vimrc inside vim."
