# To open a pdf using zathura from any directory in a new process
open() {
    local filepath
    filepath=$(realpath -m "$1") || return
    hyprctl dispatch exec "xdg-open \"$filepath\"" &
}
