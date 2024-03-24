# ~/.bashrc

export HISTSIZE=-1
export HISTFILESIZE=-1

# 
# set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias update='yay -Syu'
alias cp='cp -v'
PS1='[\u@\h \W]\$ '

# Source AutoJump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Neovim Aliases
alias n.="nvim ."
alias n=nvim
alias vim=nvim

export EDITOR=nvim

# Get Total disk usage
alias total-usage="sudo du -sh --total /"

function scroll() {
    command "$@" |& less -F 2> /dev/null
}

function copy {
    "$@" | xclip -selection clipboard
}

function download-music() {
    filename="$2"
    yt-dlp --force-overwrite --check-formats -x -o "$2".webm "$1"
    ffmpeg -i "$2".opus "$2".mp3
    rm "$2".opus
}

alias ssh-relay="ssh -R 1337:127.0.0.1:22 -N -f vultr.relay"

# I need to be fast
alias a=clear

alias x=startx
alias H=Hyprland

# environment variables
export PATH="$PATH:/opt/nvim"
export PATH="$PATH:$HOME/.local/bin"

export XDG_CONFIG_HOME="$HOME/.config"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
# --------------------------

# Start ssh-agent at login
function start-ssh-agent() {
    eval "$(ssh-agent -s)" >/dev/null
    keys=("github" "vultr.ssh")
    for key in "${keys[@]}"; do
        ssh-add ~/.ssh/$key
    done
}
[[ "$(pgrep 'ssh-agent' | wc -l)" -ne 1 ]] && start-ssh-agent > /dev/null 2>&1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/trevor/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/trevor/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/trevor/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/trevor/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias background='feh --bg-fill'
#
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
