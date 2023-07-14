# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
ZSH_COLORIZE_STYLE="colorful"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aliases colorize fd fzf git-auto-fetch rust alias-finder)

source $ZSH/oh-my-zsh.sh
alias ls='exa' # just replace ls by exa and allow all other exa arguments
alias l='ls -lbF' #   list, size, type
alias ll='ls -la' # long, all
alias llm='ll --sort=modified' # list, long, sort by modification date
alias la='ls -lbhHigUmuSa' # all list
alias lx='ls -lbhHigUmuSa@' # all list and extended
alias tree='exa --tree' # tree view
alias lS='exa -1' # one column by just names

autoload -U compinit promptinit

promptinit
prompt pure

compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'



# User configuration

if [[ $(
	$(which kubectl &>/dev/null)
	echo $?
) -eq 0 ]]; then
	source <(kubectl completion zsh)
	alias k=kubectl
	complete -F __start_kubectl k
fi

# Miscellaneous
alias mkdir='mkdir -p' #  Make those pesky parent directories by default
# export MANPATH="/usr/local/man:$MANPATH"

if [[ $(
	$(which nvim --skip-alias &>/dev/null)
	echo $?
) -ne 0 ]]; then
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x nvim.appimage
	mv nvim.appimage /usr/bin/nvim
	if [[ $(
		$(which dnf &>/dev/null)
		echo $?
	) -eq 0 ]]; then
		dnf install -y unzip clang gcc make
	elif [[ $(
		$(which apt &>/dev/null)
		echo $?
	) -eq 0 ]]; then
		apt install -y unzip clang gcc make
	fi
	echo "installed nvim"
fi

export MANPAGER='nvim +Man!'
export MANWIDTH=999
alias vim='nvim'
export EDITOR='nvim'
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Install tmux appimage to insure newer version and compatibility
if [[ $(
	$(which tmux --skip-alias &>/dev/null)
	echo $?
) -ne 0 ]]; then
	curl -LO $(curl -s https://api.github.com/repos/nelsonenzo/tmux-appimage/releases/latest |
		grep "browser_download_url.*appimage\"" |
		cut -d : -f 2,3 |
		tr -d \")
	chmod +x tmux.appimage
	mv tmux.appimage /usr/local/bin/tmux
fi

# tmux package manager needs to be pulled
if [[ ! -e ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source-file ~/.tmux.conf
fi
# alias tmux='tmux -2'

# Make a session if none exists
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
elif [[ $- =~ i ]] && [[ -z "$TMUX" ]]; then
	tmux attach-session -t default_session || tmux new-session -s default_session
fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# eval "$(zellij setup --generate-auto-start zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
