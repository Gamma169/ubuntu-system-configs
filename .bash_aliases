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

alias kubecontext="kubectl config get-contexts"
alias kp="kubectl config use-context <prod>"
alias kt="kubectl config use-context <test>"
alias kpp="kp && kubectl proxy"
alias ktp="kt && kubectl proxy"
