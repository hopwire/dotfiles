setxkbmap gb
xset b off

# Base 16 shell
BASE16_SHELL="$HOME/.zsh/base16-shell/scripts/base16-tomorrow-night.sh"
#BASE16_SHELL="$HOME/.zsh/base16-shell/scripts/base16-ocean.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#
# Completion
#
autoload -U compinit
compinit -u

# Make completion
# - case insensitive
# - accept abbreviations after . or _ or - (ie. f.b -> foo.bar
# - substring complete
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# colorise
zstyle ':completion:*' list-colors ''

# 
# Correction
#

# exceptions
alias bundle='nocorrect bundle'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'

#
# Bindings
#
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# 
# Prompt
# 

autoload -U colors
colors

setopt PROMPT_SUBST
export PS1="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%1~%(?..%F{yellow}%B!%b%f)%F{red}%B%(!.#.$)%b%f "
export SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

function zle-line-int zle-keymap-select {
  RPS1="${${KEYMAP/vicmd/--nml}/(main|viins)/--ins}"
  RPS2=$RPS1
  zle reset-prompt
}

zle -N zle-line-int
zle -N zle-keymap-select

#
# Options
#

setopt autocd                   # .. is short for cd ..
setopt autoparamslash           # tab complete appends / to directory
setopt autopushd                # cd auto pushes old dir onto dir stack
setopt pushdignoredups          # ignore dups
setopt pushdsilent              # don't print dir
setopt correct                  # command auto-correct
setopt correctall               # arg auto-correct
setopt nonomatch                # unmatched patterns left unchanged
setopt histignorealldups        # filter duplicates from history
setopt histignorespace          # don't record commands starting with space
setopt histverify               # confirm history expansions
setopt interactivecomments      # allow comments
setopt printexitvalue           # print non-zero exit status
setopt sharehistory             # share history across shells

unsetopt beep


#
# Other
#
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
#source $HOME/.zsh/colors
#source $HOME/.zsh/path
#source $HOME/.zsh/vars
