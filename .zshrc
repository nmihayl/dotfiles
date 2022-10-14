# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

pfetch

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

alias ls='exa -al --color=always --group-directories-first'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'