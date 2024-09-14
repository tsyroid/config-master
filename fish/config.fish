# ~/.config/fish/config.fish

set fish_greeting ""

# Set environment / exports
set -Ux TERM xterm-256color
set -Ux EDITOR nvim

# General aliases
alias c clear
alias :q exit # because sometimes my fingers are stupid
alias rmf 'rm -rf' # CAREFULL!!
alias mkdir 'mkdir -p'

# Eza
alias l 'eza -al --color=always --group-directories-first --git'
alias lt 'eza --tree --level=2 --long --icons --git'

# Zoxide
alias z __zoxide_z
alias zi __zoxide_zi
alias za 'zoxide add .'
alias ze 'zoxide edit'

# System
alias sf 'source ~/.config/fish/config.fish'
alias sp startplasma-wayland
alias hp Hyprland

# Navigation
alias .1 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'

# App aliases
alias v nvim
alias vi nvim
alias y yazi
alias ff fastfetch
alias zed zeditor

# Github abbreviations
abbr -a lg lazygit
abbr -a gl 'git log --graph --oneline'
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a go 'git checkout'
abbr -a ga 'git add'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a graph 'git log --all --decorate --oneline --graph'

# Path
abbr -a path "echo $PATH | tr ':' '\n'"

# USB mnt
alias mms 'udisksctl mount -b /dev/sdb'
alias lms 'ln -sf /run/media/taz/transfer ~/Sony'
alias ums 'umount /dev/sdb && rm ~/Sony'

if status is-interactive
    zoxide init fish | source
    fzf --fish | source
    starship init fish | source
end


## EOF ##
