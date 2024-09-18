# zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '/home/deck/.zshrc'
autoload -Uz compinit
compinit

# zsh plugins
source $HOME/bin/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/bin/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/.config/emacs/bin

# external aliases

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow $(cat ~/.fzf_ignore | xargs -I {} echo --exclude {})'

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char
