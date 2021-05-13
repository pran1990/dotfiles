# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# add user base to python path
#export PYTHONPATH=$(python -c "import site, os; print(os.path.join(site.USER_BASE, 'lib', 'python', 'site-packages'))"):$PYTHONPATH

# set gopath
export GOPATH=$HOME/code/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


# User specific environment and startup programs

export PATH=$PATH:$HOME/bin:/Users/praneshp/code/mongodb/bin:/usr/local/bin:/Users/praneshp/Library/Python/2.7/bin
export TZ=America/Los_Angeles
alias git='/usr/bin/git'
alias chrome='/usr/bin/open -a "/Applications/Google Chrome.app"'
alias vim='/usr/local/bin/vim'
alias subl='/usr/local/bin/subl'
alias goland='/usr/local/bin/goland'

# Always use vim
export EDITOR=vim

# bzl == mbzl
alias bzl=mbzl

# make ls beautiful
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ls='ls -GFh'

# make scp easy
alias path='echo $(id -un)@$(hostname):$(pwd)'

# git stuff
# Load in the git branch prompt script.
source ~/.git-prompt.sh
source ~/.git-completion.sh

# bzl autocomplete
source ~/bash_completion.d/bazel
source ~/bash_completion.d/bzl_completion.bash

# PS1
# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w#\\[$(tput sgr0)\\]\$(__git_ps1) "
else # normal
  PS1='[\u@\h \W$(__git_ps1 "(%s)")]\$ '
  #PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
fi


# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
#pip bash completion end


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# virtualenv
export WORKON_HOME=~/virtualenvs
# source /Users/praneshp/Library/Python/2.7/bin/virtualenvwrapper.sh


# devbox
alias x='ssh praneshp@praneshp-dbx.dev.corp.dropbox.com'
alias y='ssh praneshp@praneshp-apiproxy.dev.corp.dropbox.com'
alias reload='cd ~/src/server; mbzl itest-reload  //services/metaserver'
alias rst='cd ~/src/server; mbzl itest-stop //services/metaserver:metaserver; mbzl itest-start //services/metaserver:metaserver'
alias logs='cd ~/src/server; mbzl itest-exec  //services/metaserver -- tail -f /tmp/bzl/logs/service_logs/metaserver/metaserver_core/service.log'
alias block_logs='cd ~/src/server; mbzl itest-exec  //services/metaserver -- tail -f /tmp/bzl/logs/service_logs/blockserver/blockserver_service/service.log'
#alias mysql='cd ~/src/server; mbzl itest-exec  //services/metaserver -- /home/praneshp/src/server-mirror/bazel-bin/tools/mysql'
alias dbsh='cd ~/src/server; mbzl itest-exec  //services/metaserver -- /home/praneshp/src/server-mirror/bazel-bin/tools/shell'
alias stopall='cd ~/src/server; mbzl itest-stop-all'
alias dbstone='mbzl tool //tools:stone'
alias dbes='mbzl tool //tools:es_schema update'
alias dbprod='mbzl build //tools:prod-data-import && dbshell ./bazel-bin/tools/prod-data-import'
alias gestalt="bzl tool //dropbox/yaps/gestalt --" 


# js sdk
alias npm_reset='rm -rf node_modules/; npm install; npm run-script build;'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# gnu find
alias find='gfind'

# stick to bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# old shells :(
alias shelby="pdx-shell-1"
