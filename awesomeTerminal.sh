#!/usr/bin/env zsh
# Author: Jean Cruypenynck

# Clone and install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Get custom Prezto configuration
git clone https://github.com/nonatomiclabs/dotfiles.git ~/tmp-dotfiles
yes | cp -rf ~/tmp-dotfiles/.zpreztorc "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc
yes | cp -rf ~/tmp-dotfiles/.zshrc "${ZDOTDIR:-$HOME}"/.zshrc

# Import custom terminal theme
open ~/tmp-dotfiles/Solarized\ Dark.terminal

# Get custom fonts
git clone https://github.com/powerline/fonts ~/tmp-fonts
bash ~/tmp-fonts/install.sh

# Change default settings
osascript ~/tmp-dotfiles/changeTerminalSettings.scpt

# Remove temporary files
rm -rf ~/tmp-dotfiles
rm -rf ~/tmp-fonts

# Change the default shell to zsh
chsh -s /bin/zsh

cd ~
rm -rf ~/tmp-dotfiles
rm -rf ~/tmp-fonts
