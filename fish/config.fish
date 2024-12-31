# vim:ft=fish ts=2 sw=2 et:
# ~/.config/fish/config.fish

## [[ Configure environment (EXPORTS) ]] ##

set fish_greeting ""

# set environment / exports
set -Ux TERM xterm-256color
set -Ux EDITOR nvim

# Banish pesky .lesshst files in root
set -Ux LESSHISTFILE -

## [[ Set paths ]] ##
set -e fish_user_paths # clear user_paths
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin # macOS
fish_add_path /opt/homebrew/sbin # macOS
fish_add_path /opt/homebrew/opt/gawk/libexec/gnubin # macOS; brew
fish_add_path /opt/homebrew/opt/gnu-tar/libexec/gnubin # macOS; brew
fish_add_path $HOME/.config/emacs/bin/ # Doom Emacs

# if postgres
# fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

# if ruby
# fish_add_path /opt/homebrew/opt/ruby/bin
# fish_add_path /opt/homebrew/lib/ruby/gems/3.3.0/bin

# No abbreviated paths
set -U fish_prompt_pwd_dir_length 0

## [[ Aliases ]] ##

# General & MM
alias c clear
alias :q exit # because sometimes my fingers are stupid

# System
alias sf 'source ~/.config/fish/config.fish'
# alias hp 'Hyprland' # Linux
# alias linutil 'curl -fsSL https://christitus.com/linux | bash' # Linux

# USB mnt (Linux)
# alias mms 'udisksctl mount -b /dev/sdb'
# alias lms 'ln -sf /run/media/taz/transfer ~/Sony'
# alias ums 'umount /dev/sdb && rm ~/Sony'

# File and DIR management
alias rmf 'rm -rf'
alias mkdir 'mkdir -p'

# Eza
alias l 'eza -al --color=always --group-directories-first --git'
alias lt 'eza --tree --level=2 --long --icons --git'

# Zoxide
alias z __zoxide_z
alias zi __zoxide_zi
alias za 'zoxide add .'
alias ze 'zoxide edit'

# Navigation
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Apps
alias y yazi
alias b bat
alias vi nvim
alias ff fastfetch
# alias zed zeditor

# Github aliases
alias lg lazygit
alias gl 'git log --graph --oneline'
alias gs 'git status'
alias gd 'git diff'
alias gf 'git fetch'
alias go 'git checkout'
alias gp 'git pull'
alias ga 'git add'
alias gb 'git branch'
alias gba 'git branch -a'
alias graph 'git log --all --decorate --oneline --graph'

# Restic (Linux)
# alias backup 'restic -r /media/restic/home/ --verbose backup /home/taz/ --exclude=".src"'
# alias snapshots 'restic -r /media/restic/home snapshots'
# alias latest 'restic -r /media/restic/home ls latest | bat'

# homebrew (Linux)
alias bvf 'brew list --versions' # brew list (versions) formulas
alias bvc 'brew list --version --cask' # brew list (versions) casks

# VIFM
# https://vifm.info/
# alias vmc 'vifm ~/KB/Library/Master' # {v}ifm {m}aster {c}atalog
# alias vme 'vifm ~/KB/Library/eBooks/' # {v}ifm {m}aster {e}books
# alias vmn 'vifm ~/KB/Notes/' # {v}ifm {m}aster {n}otes
# alias vml 'vifm ~/KB/Notes/Language/'
# alias vma 'vifm ~/KB/SysAdmin/00-Inbox/' # {v}ifm {m}aster {a}dmin notes
# alias vmp 'vifm ~/KB/CS\ &\ Programming/'
# alias vms 'vifm ~/KB/Programming/Snippets/'
# alias milo 'vifm ~/KB/System\ Admin/04-Milo/'
# alias pick 'vifm ~/KB/System\ Admin/05-Pickles/'
# alias tazz 'vifm ~/KB/System\ Admin/06-Taz/'
# alias nvref 'vifm ~/KB/SysAdmin/03-Software/Neovim/'

# alias vcl 'nvim ~/KB/SysAdmin/07-Logs/@pickles-changelog/latest' # Update Changelog

# Banish those pesky .DS_Store files, recursively (macOS, of course)
# alias dsstore-clean 'find . -path ./Library/ -prune -type f -name .DS_Store -print0 | xargs -0 rm'

# Yazi shell wrapper
# (2024.11.18) Moved from functions to fix erratic behavior?
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Interactive shell inits
if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    fzf --fish | source
    starship init fish | source
    # /opt/homebrew/bin/mise activate fish | source
end


## EOF ##
