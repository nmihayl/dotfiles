# zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename '/home/deck/.zshrc'
autoload -Uz compinit
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
compinit
export EDITOR=nvim
export BROWSER=/usr/bin/firefox

# zsh keybind correction
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H"   beginning-of-line
bindkey "^[[F"   end-of-line
bindkey "^[[3~"  delete-char

# zsh plugins
source $HOME/bin/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/bin/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# path
export PATH=$PATH:~/.local/bin:~/bin:~/.config/emacs/bin

# external aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# fzf
if command -v fzf > /dev/null 2>&1; then
    source <(fzf --zsh)
fi
FD_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow $(cat ~/.fzf_ignore | xargs -I {} echo --exclude {})'
export FZF_DEFAULT_COMMAND=$FD_COMMAND FZF_CTRL_T_COMMAND=$FD_COMMAND

# yazi function for switching directories
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# cleanup
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

# env for ghcup
[ -f "/home/nick/.ghcup/env" ] && . "/home/nick/.ghcup/env"
