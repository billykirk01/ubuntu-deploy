export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    vi-mode
)

source $ZSH/oh-my-zsh.sh

alias ll='exa -lr'
alias la='exa -lra'
alias lt='exa -Tr'
alias vim='nvim'
alias top='htop'
alias fd='fdfind'

. ~/.cargo/env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/billy/.local/bin

bindkey -v

eval "$(starship init zsh)"
