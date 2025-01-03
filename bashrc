# +---+ Default +---+
case $- in
    *i*) ;;
      *) return;;
esac

# +---+ History +---+

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend # append to the history file, don't overwrite it
shopt -s checkwinsize

# +---+ Appearance +---+
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#PS1='\[\e[1;37m\]\342\224\214\342\224\200\[\e[1;37m\][\[\e[1;33m\]\u\[\e[1;37m\]@\[\e[1;36m\]\h\[\e[1;37m\]]\[\e[1;37m\]\342\224\200\[\e[1;37m\][\[\e[1;33m\]\w\[\e[1;37m\]]\[\e[1;37m\]\342\224\200[\[\e[1;37m\]\t\[\e[1;37m\]]\n\[\e[1;37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\e[1;37m\] \$ \[\e[0m\]'

PS1='\[\e[1;37m\]\342\224\214\342\224\200\[\e[1;37m\][\[\e[1;96m\]\u\[\e[1;37m\]@\[\e[1;95m\]\h\[\e[1;37m\]]\[\e[1;37m\]\342\224\200\[\e[1;37m\][\[\e[1;96m\]\w\[\e[1;37m\]]\[\e[1;37m\]\342\224\200[\[\e[1;37m\]\t\[\e[1;37m\]]\n\[\e[1;37m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\e[1;37m\] \$ \[\e[0m\]'


# +---+ Bash Completion +---+
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# +---+ Aliases and Functions +---+

[[ -f $HOME/.bash_aliases ]]   && . $HOME/.bash_aliases
[[ -f $HOME/.bash_functions ]]   && . $HOME/.bash_functions
[[ -f $HOME/.bash_motv ]] && . $HOME/.bash_motv
[[ -f $HOME/.bash_switches ]] && . $HOME/.bash_switches

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

export LC_ALL=en_US.UTF-8

#PS1='[\T]-[\w]-\$\n'
