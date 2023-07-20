source /usr/share/bash-completion/completions/git

alias gs='git status'
alias ga="git add"
alias gc="git commit -m"
alias gpull="git pull origin"
__git_complete gpull _git_pull


alias gco="git checkout"
__git_complete gco _git_checkout

alias gpush="git push origin"
__git_complete gpush _git_push

alias gb="git branch"
__git_complete gb _git_branch

alias g-no-track="git update-index --assume-unchanged"
alias g-re-track="git update-index --no-assume-unchanged"


alias kubecontext="kubectl config get-contexts"
alias kp="kubectl config use-context <prod>"
alias kt="kubectl config use-context <test>"
alias kpp="kp && kubectl proxy"
alias ktp="kt && kubectl proxy"

alias studio="studio.sh"

alias n16="nvm use 16"
alias n12="nvm use 12"

alias genw="genact -m weblog"
alias genc="genact -m simcity"
