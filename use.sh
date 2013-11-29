#!/bin/bash

PCONFIG_ROOT=`pwd`
os_distr="rh"

function detect_os()
{
    os_distr="rh"
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
    symlink_file $PCONFIG_ROOT/modules/vim/vimrc.${os_distr} ~/.vimrc
    symlink_dir $PCONFIG_ROOT/modules/vim/vim_files ~/.vim
}

function use_tmux() 
{
    symlink_file $PCONFIG_ROOT/modules/tmux/tmux.conf.${os_distr} ~/.tmux.conf
}

function use_bash() 
{
    symlink_file $PCONFIG_ROOT/modules/bash/bashrc.${os_distr} ~/.bashrc
}

function use_screen() 
{
    symlink_file $PCONFIG_ROOT/modules/screen/screenrc.${os_distr} ~/.screenrc

}


command=$1
detect_os


case $command in
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


