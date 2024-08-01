# zsh specific
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -e
zstyle :compinstall filename '/home/nick/.zshrc'
autoload -Uz compinit
compinit

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# path
export PATH=$PATH:~/bin

# fzf ignore folders
export FZF_DEFAULT_COMMAND='find . \( -name .steam -o -name flatpak -o -name .cache \) -prune -o -print'

# aliases
eval "$(fzf --zsh)"
alias cat="bat"
alias fzf-bat="fzf --preview 'bat --style=numbers --color=always {}'"
yt-add() {
    echo "$1" >> /mnt/seagate2tb-share/YouTube/downloads.txt
}
alias mount-server='sudo sshfs -o allow_other,IdentityFile=/home/nick/.ssh/id_rsa nick@fedora:/ /mnt/fedora-server'
alias md2pdf='function _md2pdf() { pandoc -i "$1" -o "${1%.md}.pdf"; }; _md2pdf'
alias ls='exa -ia --hyperlink --no-quotes --group-directories-first'
alias ll='exa -lia --hyperlink --no-quotes --group-directories-first'
