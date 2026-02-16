# To open a pdf using zathura from any directory in a new process
open() {
    local filepath
    filepath=$(realpath -m "$1") || return
    hyprctl dispatch exec "xdg-open \"$filepath\"" &
}

search_command_history() {
    local histfile="/home/andreas/.config/zsh/histfile"

    local cmd
    cmd=$(tac "$histfile" | fzf --height 40% --layout=reverse --bind 'tab:down,shift-tab:up' --no-sort)
    if [[ -z "$cmd" ]]; then
        zle reset-prompt
        return
    fi

    LBUFFER+="$cmd"
    zle reset-prompt
    zle accept-line
}
zle -N search_command_history
bindkey '^R' search_command_history

# Fuzzy finder for files and directories
fzf_fd() {
    local file
    file=$(find ~/. -type f -o -type d 2>/dev/null \
        | fzf --height 100% --reverse \
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
