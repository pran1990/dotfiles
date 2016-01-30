# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions
alias path='echo $(id -un)@$(hostname):$(pwd)'
alias ts='date +%s'
date_to_timestamp() {
  date -d @$1 "+%m-%d-%Y %T"
}
alias dt=date_to_timestamp


# Load in the git branch prompt script.
source ~/.git-prompt.sh
source ~/.git-completion.sh

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w#\\[$(tput sgr0)\\]\$(__git_ps1) "
else # normal
  PS1='[\u@\h \W$(__git_ps1 "(%s)")]\$ '
fi
