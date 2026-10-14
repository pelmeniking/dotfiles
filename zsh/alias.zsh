# ~/.config/zsh/aliases.zsh
# central alias managment for zsh
# use "source ~/.config/zsh/alias.zsh" instead of manual alias entrys

alias cls='clear'

alias ls='eza --icons=always --group-directories-first'
alias ll='eza -lah --git --icons=always --group-directories-first'
alias l='eza -1 --icons=always'
alias lc='eza --icons=auto --code'
alias lt='eza --tree --icons=always --level=3'
alias tree='eza --tree --icons=auto'

alias ...='cd ../..'

alias gf='git fetch && git pull'

alias p='nocorrect p'
alias c='nocorrect c'

alias cat='bat'
alias grep='grep --color=auto'

alias df='duf'

alias ports='ss -tulpn'
alias myip='ip -brief addr'

alias top='btop'
alias mem='free -h'
alias cpu='lscpu'
