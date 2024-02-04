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

# Initialize Conda
# eval "$(/home/trevor/anaconda3/bin/conda shell.bash hook)"

export SCHOOL_IP="169.254.119.23"

# Get Total disk usage
alias total-usage="sudo du -sh --total /"

function searchfor() {
    sudo find / -regex ".*$1.*"
}

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

neofetch
