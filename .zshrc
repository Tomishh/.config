# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap
source ~/.zsh/znap/znap.zsh  # Start Znap

# setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=10000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export TERM=xterm-256color
export PATH=$PATH:/opt/nvim-linux-x86_64/bin # Sourcing Neovim
export PATH=$PATH:/home/tomish/.local/bin # À changer en fonction du user
export PATH=$PATH:/usr/local/bin/nvim-linux-x86_64/bin
export PATH=$PATH:/usr/local/go/bin
if command -v exa >/dev/null; then
    alias ls='eza --icons=always -F --no-user --no-permissions -l --group-directories-first --sort extension'
    alias l='eza --icons=always -F -l --group-directories-first -a --sort extension'
    alias lt='eza --tree'
else
    alias ls='/bin/ls $LS_OPTIONS'
fi
alias bat="batcat --style plain --pager never"
eval "$(oh-my-posh init zsh --config '/home/tomish/.config/oh-my-posh/themes/craver.omp.json')"
# Theme : https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/craver.omp.json
# Chargement de mes fonctions persos
if [ -d "$HOME/.zsh_functions" ]; then
  for f in $HOME/.zsh_functions/*.zsh; do
    source "$f"
  done
fi
znap source zsh-users/zsh-autosuggestions
znap source MichaelAquilina/zsh-you-should-use
znap source zdharma-continuum/history-search-multi-word
znap source zdharma-continuum/fast-syntax-highlighting
znap source marlonrichert/zsh-autocomplete

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"


WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# clear
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/home/tol/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tol/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tol/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tol/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tol/perl5"; export PERL_MM_OPT;
