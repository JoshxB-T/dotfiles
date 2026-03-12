#
# zsh configuration
#

# -- Prompt Theme --------------------------------------------------------------
PS1='%F{203}%n%f@%F{81}deadspace %F{250}%~%f $ '

# -- History -------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=8000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt NO_BEEP

# -- Completion ----------------------------------------------------------------
autoload -Uz compinit
compinit
setopt MENU_COMPLETE
setopt AUTO_LIST

# -- Correction ----------------------------------------------------------------
setopt CORRECT
setopt CORRECT_ALL

# -- Directory navigation ------------------------------------------------------
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# -- Keybinds ------------------------------------------------------------------
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# -- Aliases -------------------------------------------------------------------
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alh'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias sn='shutdown now'

# -- Autosuggestions -----------------------------------------------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# -- Syntax Highlighting Theme -------------------------------------------------
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=250'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=203'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=81'

# -- Plugins -------------------------------------------------------------------
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
