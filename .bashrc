#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# environment variables
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gvim'; else echo 'vim'; fi)"	# gvim, vim

# pacman aliases (if desired, adapt for your favourite AUR helper)
alias pac="sudo /usr/bin/pacman -S"			# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"			# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rns"			# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"			# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"			# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"			# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"			# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"			# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="sudo /usr/bin/pacman -D --asexp"		# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="sudo /usr/bin/pacman -D --asdep"		# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

alias pacunlock="sudo rm /var/lib/pacman/db.lck"	# delete the lock file /var/lib/pacman/db.lck
alias paclock="sudo touch /var/lib/pacman/db.lck"	# create the lock file /var/lib/pacman/db.lck

complete -cf sudo
complete -cf man

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

export PATH=$PATH:/home/kod/bin

