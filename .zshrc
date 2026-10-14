if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  dnf
  docker
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  colored-man-pages
)

source "$ZSH/oh-my-zsh.sh"
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/function.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eza-update() {
    local VERSION
    local TMPDIR

    TMPDIR=$(mktemp -d) || return 1

    VERSION=$(
        curl -s https://api.github.com/repos/eza-community/eza/releases/latest |
        grep '"tag_name"' |
        cut -d '"' -f4
    )

    cd "$TMPDIR" || return 1

    curl -L \
        "https://github.com/eza-community/eza/releases/download/${VERSION}/eza_x86_64-unknown-linux-musl.tar.gz" \
        -o eza.tar.gz

    tar -xzf eza.tar.gz

    sudo install -m 755 eza /usr/local/bin/eza

    echo
    eza --version

    rm -rf "$TMPDIR"
}

# Aliase

alias ls='eza --icons=always --group-directories-first'
alias ll='eza -lah --git --icons=always --group-directories-first'
alias lt='eza --tree --icons=always --level=3'
alias l='eza -1 --icons=always'

alias cat='bat'
alias grep='grep --color=auto'

alias ports='ss -tulpn'
alias myip='ip -brief addr'

alias df='duf'
alias top='btop'
alias mem='free -h'
alias cpu='lscpu'

alias cls='clear'
