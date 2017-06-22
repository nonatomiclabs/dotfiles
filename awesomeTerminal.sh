#!/usr/bin/env zsh
# Author: Jean Cruypenynck

# Clone and install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Get custom Prezto configuration
git clone https://github.com/nonatomiclabs/dotfiles.git ~/Desktop/dotfiles
yes | cp -rf ~/Desktop/dotfiles/.zpreztorc "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc

# Import custom terminal theme
open ~/Desktop/dotfiles/Solarized\ Dark.terminal

# Get custom fonts
git clone https://github.com/powerline/fonts ~/Desktop/fonts
bash fonts/install.sh

# Change default settings
osascript ~/Desktop/dotfiles/changeTerminalSettings.scpt

# Remove temporary files
rm -rf ~/Desktop/dotfiles
rm -rf ~/Desktop/fonts

# Change the default shell to zsh
chsh -s /bin/zsh
