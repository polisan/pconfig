#!/bin/bash

PCONFIG_ROOT=`pwd`
os_distr="rh"

function detect_os()
{
#    os_distr="rh"
    echo "not implemented!"
}

function symlink_file()
{
    orig=$1
    if [ ! -f "$orig" ]; then
        return
    fi
    target=$2
    if [ -f "$target" ]; then
        rm $target
    fi
    ln -sf $orig $target
}

function symlink_dir()
{
    orig=$1
    if [ ! -d "$orig" ]; then
        return
    fi
    target=$2
    if [ -d "$target" ]; then
        rm -rf $target
    fi
    ln -sf $orig $target
}

function use_vim() 
{
    symlink_file $PCONFIG_ROOT/modules/vim/vimrc ~/.vimrc
    symlink_dir $PCONFIG_ROOT/modules/vim/vim_files ~/.vim
}

function use_tmux() 
{
    if [ "$os_distr" == "mac" ]; then
        symlink_dir $PCONFIG_ROOT/local.mac $PCONFIG_ROOT/local
    else
        symlink_dir $PCONFIG_ROOT/local.rh $PCONFIG_ROOT/local
    fi
    symlink_file $PCONFIG_ROOT/modules/tmux/tmux.conf.${os_distr} ~/.tmux.conf
}

function use_bash() 
{
    if [ "$os_distr" == "mac" ]; then
        symlink_file $PCONFIG_ROOT/modules/bash/bashrc.${os_distr} ~/.bashrc
        symlink_file $PCONFIG_ROOT/modules/bash/bash_profile.${os_distr} ~/.bash_profile
    else 
        symlink_file $PCONFIG_ROOT/modules/bash/bashrc.${os_distr} ~/.bashrc
        symlink_file $PCONFIG_ROOT/modules/bash/bash_profile.${os_distr} ~/.bash_profile
    fi
    echo "use_bash done"
}

function use_screen() 
{
    symlink_file $PCONFIG_ROOT/modules/screen/screenrc.${os_distr} ~/.screenrc

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


