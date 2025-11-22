# Fuzzy finder for files and directories
fzf_fd() {
    local file
    file=$(find ~/. -type f -o -type d 2>/dev/null | fzf --height 40% --reverse --bind 'tab:down,shift-tab:up') || return
    if [[ -d "$file" ]]; then
        cd "$file" || return
    else
        ${EDITOR:-nvim} "$file"
    fi
}

# Make it a ZLE widget
zle -N fzf_fd

# Bind Ctrl-f to the widget
bindkey '^f' fzf_fd
