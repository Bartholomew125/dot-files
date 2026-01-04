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
