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
bldred='\e[1;31m'
txtrst='\e[0m'

print_before_the_prompt () {
    printf '%0.s~' $(seq 1 $COLUMNS)
    printf "\n$bldred%s$txtrst at $bldred%s$txtrst in $bldred%s/$txtrst\n$txtrst" "$USER" "$HOSTNAME" "$PWD"
}
PROMPT_COMMAND=print_before_the_prompt
PS1="->"
