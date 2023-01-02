#!/bin/bash

# Get the directory in which this script lives.
script_dir=$(dirname "$(readlink -f "$0")")


create_symlinks() {
    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks

echo "Setting up oh-my-zsh..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
ln -s "$script_dir/burner.zsh-theme" "$ZSH_CUSTOM/themes/burner.zsh-theme"
