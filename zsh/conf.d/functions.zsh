# To open a pdf using zathura from any directory in a new process
pdf() {
    local filepath
    filepath=$(realpath -m "$1") || return
    hyprctl dispatch exec "zathura \"$filepath\"" &
}
