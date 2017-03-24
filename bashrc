# alias
alias bb="cd .."

alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias lsn="ls -1 | wc -l"

alias topp="top -u $USER"

alias dm="du -sh"

alias gaa="git add -A"
alias gcm="git commit -m"
alias gpu="git push -u"

alias py="python -u"
alias vi="vim"

alias bbash="vim ~/.bashrc"
alias bashh="source ~/.bashrc"

# prompt settings
cred='\e[1;31m'
crst='\e[0m'

print_before_the_prompt () {
    printf '%0.s~' $(seq 1 $COLUMNS)
    printf "\n$cred%s$crst at $cred%s$crst in $cred%s/$crst\n" "$USER" "$HOSTNAME" "$PWD"
}
PROMPT_COMMAND=print_before_the_prompt
PS1="->"
