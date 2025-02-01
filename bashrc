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
alias cp='cp -v'

PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export BROWSER=librewolf

# Get Total disk usage
alias total-usage="sudo du -sh --total /"

# environment variables
export PATH="$PATH:/opt/nvim"
export PATH="$PATH:$HOME/.local/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export HYPRSHOT_DIR="$HOME/screenshots"

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

source /home/trevor/.aliasrc
source /home/trevor/.functionrc
source /home/trevor/.env

source /home/trevor/scripts/bash/albums.sh
source /home/trevor/scripts/bash/wallpaper.sh
source /home/trevor/scripts/bash/trading.sh

eval "$(jump shell)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"

source <(kubectl completion bash)
complete -F _play_completions play

