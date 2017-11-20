alias reload="source ~/.bash_profile"

# github.com/scop/bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# github.com/rupa/z
if [ -f ~/z.sh ]; then
   source ~/z.sh
fi

#### Sensible Bash - github.com/mrzool/bash-sensible ####

# # Unique Bash version check
# if ((BASH_VERSINFO[0] < 4))
# then
#   echo "sensible.bash: Looks like you're running an older version of Bash."
#   echo "sensible.bash: You need at least bash-4.0 or some options will not work correctly."
#   echo "sensible.bash: Keep your software up-to-date!"
# fi

## GENERAL OPTIONS ##

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

#### Bashtrap - github.com/barryclark/bashstrap ####

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias ll='ls -alGh $@' # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."

# Colored up cat!
alias cat="highlight -O ansi"

#### My own stuff ####

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
bind '"\ex": kill-whole-line'

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
