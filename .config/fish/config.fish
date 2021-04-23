starship init fish | source

function activate
    source $argv[1]/bin/activate.fish
end

function venv
    activate venv
end

function create_venv
    virtualenv .venv --prompt (basename (pwd))
    activate .venv
end

alias gst="git status"
alias cat="bat"
alias ls="lsd"

# Created by `userpath` on 2020-10-02 20:16:49
set PATH $PATH /Users/tomer/.local/bin

source ~/.cargo/env
source ~/.secrets
