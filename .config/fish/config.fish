#starship init fish | source

function activate
    source $argv[1]/bin/activate.fish
end

function venv
    activate .venv
end

function create_venv
    virtualenv .venv --prompt (basename (pwd))
    activate .venv
end

alias gst="git status"
alias cat="bat"
# alias ls="lsd"
alias less="bat --language=man"
alias clipcopy="pbcopy"
alias clippaste="pbpaste"

# Created by `userpath` on 2020-10-02 20:16:49
set PATH $PATH /Users/tomer/.local/bin
set -gx MANPAGER "bat -l man"
set -gx PAGER bat --plain
set -gx ANDROID_HOME $HOME/Library/Android/sdk

source ~/.cargo/env
source ~/.secrets

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
