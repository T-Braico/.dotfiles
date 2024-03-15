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

function watch-videos() {
    for i in {1..10}; do
        mpv "Video $i.wmv"
    done
}

function scroll() {
    command "$@" |& less -F 2> /dev/null
}

function copy {
    "$@" | xclip -selection clipboard
}

function download-music() {
    yt-dlp --force-overwrite --check-formats -x -o "$2" "$1"
}

alias ssh-relay="ssh -R 1337:127.0.0.1:22 -N -f vultr.relay"

# I need to be fast
alias a=clear

alias x=startx
alias H=Hyprland

export PATH="$PATH:/opt/nvim"
export PATH="$PATH:$HOME/.local/bin/"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Start ssh-agent at login

function start-ssh-agent() {
    eval "$(ssh-agent -s)" >/dev/null
    keys=("github" "vultr.ssh")
    for key in "${keys[@]}"; do
        ssh-add ~/.ssh/$key
    done
}

function shuffle() {
    python ~/scripts/python/shuffle.py
}

# Start ssh-agent not already
[[ "$(pgrep 'ssh-agent' | wc -l)" -ne 1 ]] && start-ssh-agent > /dev/null 2>&1

# neofetch

# cht.sh tab completion
if [[ ! -f ~/.bash.d/cht.sh ]]; then
    curl https://cheat.sh/:bash_completion > ~/.bash.d/cht.sh
    . ~/.bash.d/cht.sh
fi

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

function convert(){
    for file in *.opus; do
        echo ${file%.*}.mp3
        ffmpeg -i $file ${file%.*}.mp3 1>/dev/null 2>&1
        rm $file 2>/dev/null
    done
}

alias background='feh --bg-fill'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
