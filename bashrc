export PATH_DOTFILES="/Users/hoch4240/Chen/mygit/dotfiles"

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
#alias vi="pim"

alias bbash="vim ~/.bashrc"
alias bashh="source ~/.bashrc"

alias lazygit="git add -A; git commit -m \"daily commit (too lazy to type)\"; git push origin"

alias bbash="vim ~/.bash_profile"
alias bashh="source ~/.bashrc"

#+ prompt settings
print_before_the_prompt () {
    printf "%0.s~" $(seq 1 $COLUMNS)
}
PROMPT_COMMAND=print_before_the_prompt
if [ -f "$PATH_DOTFILES/extra/bash-git-prompt/gitprompt.sh" ]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        GIT_PROMPT_START="\e[0;32m\u\e[0m at \e[0;31m$HOSTNAME\e[0m in \e[0;34m\$PWD/\e[0m"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        GIT_PROMPT_START="\e[0;32m\u\e[0m at \e[0;31m$(scutil --get ComputerName)\e[0m in \e[0;34m\$PWD/\e[0m"
    fi
    GIT_PROMPT_END="\n->"
    __GIT_PROMPT_DIR="$PATH_DOTFILES/extra/bash-git-prompt"
    source "$PATH_DOTFILES/extra/bash-git-prompt/gitprompt.sh"
fi
#-
