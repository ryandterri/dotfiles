#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias ll='ls -l'
alias la='ls -a'
alias nv='nvim'

eval "$(starship init bash)"
