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
bash ~/Desktop/fonts/install.sh

# Change default settings
osascript ~/Desktop/dotfiles/changeTerminalSettings.scpt

# Remove temporary files
rm -rf ~/Desktop/dotfiles
rm -rf ~/Desktop/fonts

# Change the default shell to zsh
chsh -s /bin/zsh

# Bind keypad keys
echo '\n\n# Keypad\n# 0 . Enter\nbindkey -s "^[Op" "0"\nbindkey -s "^[Ol" "."\nbindkey -s "^[OM" "^M"\n# 1 2 3\nbindkey -s "^[Oq" "1"\nbindkey -s "^[Or" "2"\nbindkey -s "^[Os" "3"\n# 4 5 6\nbindkey -s "^[Ot" "4"\nbindkey -s "^[Ou" "5"\nbindkey -s "^[Ov" "6"\n# 7 8 9\nbindkey -s "^[Ow" "7"\nbindkey -s "^[Ox" "8"\nbindkey -s "^[Oy" "9"\n# + -  * /\nbindkey -s "^[Ok" "+"\nbindkey -s "^[Om" "-"\nbindkey -s "^[Oj" "*"\nbindkey -s "^[Oo" "/"' >> ~/.zshrc