# Fuzzy finder for files and directories
fzf_fd() {
    local file
    file=$(find ~/. -type f -o -type d 2>/dev/null \
        | fzf --height 40% --reverse \
              --bind 'tab:down,shift-tab:up' \
              --preview='head -$LINES {}')

    if [[ -z "$file" ]]; then
        zle reset-prompt
        return
    fi
    
    
    if [[ -d "$file" ]]; then
        cd "$file" || return
    else
        ${EDITOR:-nvim} "$file"
    fi
    zle reset-prompt
}

# Make it a ZLE widget
zle -N fzf_fd

# Bind Ctrl-f to the widget
bindkey '^f' fzf_fd
