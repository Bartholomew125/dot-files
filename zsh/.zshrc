# Vim key bindings
bindkey -v

# Source conf.d
for f in ~/.config/zsh/conf.d/*.zsh; do
    source "$f"
done

