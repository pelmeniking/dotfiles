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
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh<
