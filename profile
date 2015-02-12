if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# macports
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# others
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=${PATH}:${HOME}/bin
PATH=${PATH}:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin
PATH=${PATH}:/opt/local/bin
PATH=${PATH}:/opt/local/sbin
export PATH

export MANPATH=${MANPATH}/opt/local/share/man
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# vim: set ft=sh:

