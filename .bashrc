# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions


# Alias definitions.
# You may want to put all your additions into a separate file like
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

# Get that kubectl alias we use every single day 
if [[ $($(which kubectl &> /dev/null); echo $?) -eq 0 ]]; then
    source <(kubectl completion bash)
    alias k=kubectl
    complete -F __start_kubectl k
fi

# Miscellaneous
alias mkdir='mkdir -p'     #  Make those pesky parent directories by default

if [[ $($(which nvim --skip-alias &> /dev/null); echo $?) -ne 0 ]]; then
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage /usr/bin/nvim
    if [[ $($(which dnf &> /dev/null); echo $?) -eq 0 ]]; then
	dnf install -y unzip clang gcc make
    elif [[ $($(which apt &> /dev/null); echo $?) -eq 0 ]]; then
	apt install -y unzip clang gcc make
    fi
    echo "installed nvim"
fi

export MANPAGER='nvim +Man!'
export MANWIDTH=999

alias vim=nvim

# If running WSL, change DISPLAY variable for X11 forwarding / clipboard 
if [[ -n $WSL_DISTRO_NAME ]]; then
    export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
fi

# Install tmux appimage to insure newer version and compatibility
if [[ $($(which tmux --skip-alias &> /dev/null); echo $?) -ne 0 ]]; then
    curl -LO $(curl -s https://api.github.com/repos/nelsonenzo/tmux-appimage/releases/latest \
    | grep "browser_download_url.*appimage\"" \
    | cut -d : -f 2,3 \
    | tr -d \") 
    chmod +x tmux.appimage
    mv tmux.appimage /usr/local/bin/tmux
fi

# tmux package manager needs to be pulled
if [[ ! -e ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

alias tmux='TERM=screen-256color tmux'

# Make a session if none exists
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
elif [[ $- =~ i ]] && [[ -z "$TMUX" ]]; then
    tmux attach-session -t default_session || tmux new-session -s default_session
fi
