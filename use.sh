#!/bin/bash

function use_vim() {
}


function use_tmux() {
}

function use_bash() {
}

function use_screen() {
}


command=$1


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


