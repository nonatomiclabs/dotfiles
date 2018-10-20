# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Make the keypad work
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# Color "cat" output
alias cat='highlight -O xterm256 -l --force -s solarized-light'

# Make "less" retain colors
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# Fix for the UTF-8 Python bug
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# Expand aliases
globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias
bindkey " " globalias

# Enable Zsh highlighting - MUST BE THE LAST SOURCED ZSH PLUGIN
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=/usr/local/bin:$PATH
