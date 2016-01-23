#!/bin/bash

PCONFIG_ROOT=`pwd`
os_distr="rh"

function detect_os()
{
#    os_distr="rh"
    echo "not implemented!"
}

function symlink()
{
    ln -snf $1 $2 
}

function use_vim() 
{
    symlink $PCONFIG_ROOT/modules/vim/vimrc ~/.vimrc
    symlink $PCONFIG_ROOT/modules/vim/vim_files ~/.vim
}

function use_tmux() 
{
    symlink $PCONFIG_ROOT/local.${os_distr} $PCONFIG_ROOT/local
    symlink $PCONFIG_ROOT/modules/tmux/tmux.conf.${os_distr} ~/.tmux.conf
    symlink $PCONFIG_ROOT/modules/tmux/tmux ~/.tmux
}

function use_bash() 
{
    if [ "$os_distr" == "mac" ]; then
        symlink $PCONFIG_ROOT/modules/bash/bashrc.${os_distr} ~/.bashrc
        symlink $PCONFIG_ROOT/modules/bash/bash_profile.${os_distr} ~/.bash_profile
    else 
        symlink $PCONFIG_ROOT/modules/bash/bashrc.${os_distr} ~/.bashrc
        symlink $PCONFIG_ROOT/modules/bash/bash_profile.${os_distr} ~/.bash_profile
    fi
    echo "use_bash done"
}

function use_screen() 
{
    symlink $PCONFIG_ROOT/modules/screen/screenrc.${os_distr} ~/.screenrc

}


os_distr=$1
command=$2
detect_os


case $command in
    local)
        ;;
    tmux)
        use_tmux
        ;;
    bash)
        use_bash
        ;;
    screen)
        use_screen
        ;;
    vim)
        use_vim
        ;;
    *)
        use_tmux
        use_vim
        use_bash
esac


