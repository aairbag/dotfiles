export PATH=$PATH:/Users/joltdev/Library/Python/2.7/bin

# https://github.com/banga/powerline-shell.git
function _update_ps1() {
    local exit="$?"
    if [ $exit != 0 ]; then
        local code="\[\e[;31m\]$exit ➜ \[\e[0m\]" # previous command failure = red
    else
        local code="\[\e[1;32m\]➜ \[\e[0m\]" # previous command success = green
    fi

    PS1="$(powerline-shell $?)$code "
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; update_terminal_cwd"
fi

# Custom aliases
alias reload='source ~/.bash_profile'
alias cp='cp -iv' # copy file(s) -stderr if overwriting existing file -verbose
alias mv='mv -iv' # move file(s) -stderr if overwriting existing file -verbose
alias mkdir='mkdir -v' # make directory -verbose
alias path='echo -e ${PATH//:/\\n}' # echos all executable paths
alias ls='ls -G' # list directory contents --colorized
alias ll='ls -FGlahp' # list directory contents -display symbols based on filetype -colorized -long format -all -unit suffixes -slash after directory
alias finder='open -a Finder ./' # opens current directory in macOS Finder
alias c='clear'
alias h='history'
alias grep='grep --color=auto' # file pattern searcher --colorized
alias ip='whoami ; echo -e \ - Public IP Address: ; curl ipecho.net/plain ; echo ; echo -e \ - Internal IP Address: ;  ipconfig getifaddr en0' # show public and local ip adresses
alias watch='watch '
cd() { builtin cd "$@"; ls; }

# Kubernetes
alias k='kubectl'
alias ktouch='kubectl create'
alias kf='kubectl create -f'
alias krm='kubectl delete'
alias kvi='kubectl edit'
alias kman='kubectl explain'
alias kls='kubectl get -o wide'
alias kcat='kubectl get -oyaml'

# kubectl get
alias kapiservices='kubectl get --all-namespaces -o wide apiservices'
alias kcsr='kubectl get --all-namespaces -o wide csr'
alias kclusters='kubectl get --all-namespaces -o wide clusters'
alias kclusterrolebindings='kubectl get -o wide clusterrolebindings'
alias kclusterroles='kubectl get -o wide clusterroles'
alias kcs='kubectl get -o wide cs'
alias kcm='kubectl get --all-namespaces -o wide cm'
alias kcontrollerrevisions='kubectl get --all-namespaces -o wide controllerrevisions'
alias kcronjobs='kubectl get --all-namespaces -o wide cronjobs'
alias kcrd='kubectl get --all-namespaces -o wide crd'
alias kds='kubectl get --all-namespaces -o wide ds'
alias kdeploy='kubectl get --all-namespaces -o wide deploy'
alias kep='kubectl get --all-namespaces -o wide ep'
alias kev='kubectl get --all-namespaces -o wide ev'
alias khpa='kubectl get --all-namespaces -o wide hpa'
alias king='kubectl get --all-namespaces -o wide ing'
alias kjobs='kubectl get --all-namespaces -o wide jobs'
alias klimits='kubectl get --all-namespaces -o wide limits'
alias kns='kubectl get -o wide ns'
alias knetpol='kubectl get --all-namespaces -o wide netpol'
alias kno='kubectl get -o wide no'
alias kpvc='kubectl get --all-namespaces -o wide pvc'
alias kpv='kubectl get --all-namespaces -o wide pv'
alias kpdb='kubectl get --all-namespaces -o wide pdb'
alias kpodpreset='kubectl get --all-namespaces -o wide podpreset'
alias kpo='kubectl get --all-namespaces -o wide po'
alias kpsp='kubectl get --all-namespaces -o wide psp'
alias kpodtemplates='kubectl get --all-namespaces -o wide podtemplates'
alias krs='kubectl get --all-namespaces -o wide rs'
alias krc='kubectl get --all-namespaces -o wide rc'
alias kquota='kubectl get --all-namespaces -o wide quota'
alias krolebindings='kubectl get --all-namespaces -o wide rolebindings'
alias kroles='kubectl get --all-namespaces -o wide roles'
alias ksecrets='kubectl get --all-namespaces -o wide secrets'
alias ksa='kubectl get --all-namespaces -o wide sa'
alias ksvc='kubectl get --all-namespaces -o wide svc'
alias kstatefulsets='kubectl get --all-namespaces -o wide statefulsets'
alias kstorageclasses='kubectl get -o wide storageclasses'

alias klocal='export KUBECONFIG='
alias kstage='export KUBECONFIG=~/kubeconfig-iptesting.yaml'

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash ] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash
