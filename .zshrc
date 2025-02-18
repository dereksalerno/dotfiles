export PATH=/root/.cargo/bin:/usr/jre17.0.11.0.9-2.el9/bin:/usr/jre17.0.11.0.9-2.el9/bin:/root/.local/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/usr/local/go/bin:/root/go/bin

# tmux package manager needs to be pulled
if [[ ! -e ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux source-file ~/.tmux.conf
fi

# Make a session if none exists
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
elif [[ $- =~ i ]] && [[ -z "$TMUX" ]]; then
  tmux attach-session -t default_session || tmux new-session -s default_session
fi
fpath=(/usr/local/share/zsh/site-functions $fpath)
[[ -d ${ZDOTDIR:-~}/.antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote && source ${ZDOTDIR:-~}/.antidote/antidote.zsh

zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins

[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=($HOME/.antidote/functions $fpath)
autoload -Uz antidote
if [ $commands[bat] ]; then
  alias cat='bat -p'
fi
unsetopt beep

vi-mode() { set -o vi; }
emacs-mode() { set -o emacs; }
zle -N vi-mode
zle -N emacs-mode
bindkey '\ei' vi-mode              # switch to vi "insert" mode
bindkey -M viins 'jk' vi-cmd-mode  # (optionally) switch to vi "cmd" mode
bindkey -M viins '\ei' emacs-mode  # switch to emacs mode
bindkey -M viins '\e.' insert-last-word


# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi
zstyle ':antidote:bundle' use-friendly-names 'yes'

# End of lines added by compinstall
eval "$(zoxide init zsh)"
set -o emacs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.bin/helper_scripts.sh ] && source /root/.bin/helper_scripts.sh

source <(helm completion zsh)
source <(fzf --zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Source your static plugins file.
source ${zsh_plugins}.zsh

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt notify

zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
if [ $commands[kubectl] ]; then
  alias k=kubectl
  source <(kubectl completion zsh)
  kubectl completion zsh > "${fpath[0]}/_kubectl"
  compdef k='kubectl'
fi
if [ $commands[oc] ]; then
  source <(oc completion zsh)
  compdef _oc oc
fi
if [ $commands[oc-mirror] ]; then
  source <(oc-mirror completion zsh)
  compdef _oc-mirror oc-mirror
fi
if [ $commands[istioctl] ]; then
  source <(istioctl completion zsh)
  compdef _istioctl istioctl
fi

# Miscellaneous
alias mkdir='mkdir -p' #  Make those pesky parent directories by default


export MANPAGER='nvim +Man!'
export MANWIDTH=999
alias vim='nvim'
export EDITOR='nvim'

eval "$(starship init zsh)"
