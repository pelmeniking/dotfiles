# ~/.config/zsh/functions.zsh
# central functions management

cdf() {
    local dir
    dir="$(
        fd . --type d --exclude .git --exclude node_modules --exclude .cache |
        fzf \
            --height=80% \
            --layout=reverse \
            --border \
            --preview-window=right:60% \
            --preview 'eza --tree --icons=always --color=always --level=3 {}'
    )"
    [[ -n "$dir" ]] && cd "$dir"
}

function p() {
    local repos="$HOME/repos"
    if [[ -z "$1" ]]; then
        cd "$repos"
        return
    fi
    local dir
    dir="$(find "$repos" -mindepth 1 -maxdepth 3 -type d -name "$1" 2>/dev/null | head -n 1)"
    if [[ -n "$dir" ]]; then
        cd "$dir"
    else
        echo "no folder '$1' in $repos found"
        return 1
    fi
}

function c() {
    local config="$HOME/.config"
    if [[ -z "$1" ]]; then
        cd "$config"
        return
    fi
    local dir
    dir="$(find "$config" -mindepth 1 -maxdepth 3 -type d -name "$1" 2>/dev/null | head -n 1)"
    if [[ -n "$dir" ]]; then
        cd "$dir"
    else
        echo "no folder '$1' in $.config gefunden"
        return 1
    fi
}
