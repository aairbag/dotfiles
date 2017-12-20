alias reload="source ~/.bash_profile"
alias watch='watch '

# github.com/scop/bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# github.com/rupa/z
if [ -f ~/z.sh ]; then
   source ~/z.sh
fi

# github.com/ahmetb/kubectl-aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

#### Sensible Bash - github.com/mrzool/bash-sensible ####

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
alias cat="highlight -O ansi --force"

#### My own stuff ####

alias cp='cp -iv' # copy file(s) -stderr if overwriting existing file -verbose
alias mv='mv -iv' # move file(s) -stderr if overwriting existing file -verbose
alias mkdir='mkdir -pv' # make directory -verbose
alias path='echo -e ${PATH//:/\\n}' # echos all executable paths
alias ls='ls -G' # list directory contents --colorized
alias ll='ls -FGlahp' # list directory contents -display symbols based on filetype -colorized -long format -all -unit suffixes -slash after directory
alias finder='open -a Finder ./' # opens current directory in macOS Finder
alias c='clear'
alias h='history'
alias grep='grep --color=auto' # file pattern searcher --colorized
alias ip='whoami ; echo -e \ - Public IP Address: ; curl ipecho.net/plain ; echo ; echo -e \ - Internal IP Address: ;  ipconfig getifaddr en0' # show public and local ip adresses
cd() { builtin cd "$@"; ls; }
bind '"\ex": kill-whole-line' # delete entire line with alt-x

function kontext() {
  PS3="Enter context number: "
  contexts=("minikube" "juju-context" "will.iptesting.net" "Unset context" "Quit")
  select context in "${contexts[@]}"
  do
    case $context in
      "minikube")
        export KUBECONFIG=~/.kube/config
        kubectl config use-context minikube
        break
        ;;
      "juju-context")
        export KUBECONFIG=~/.kubeconfig/kubeconfig_pequod.yaml
        kubectl config use-context juju-context
        break
        ;;
      "will.iptesting.net")
        export KUBECONFIG=~/.kubeconfig/kubeconfig-iptesting.yaml
        kubectl config use-context will.iptesting.net
        break
        ;;
      "Unset context")
        kubectl config unset current-context
        break
        ;;
      "Quit")
        break
        ;;
      *) echo wrong;;
    esac
  done
}

export -f kontext
