#!/bin/bash

function add_plugin()
{
    if [ $# -lt 3 ]
    then
        echo "Usage: $0 add <git_url> <destination>"
    else
        echo "Adding plugin $2 into $3..."
        git submodule init
        git submodule add "$2" "$3" || { echo 'Failed at git submodule add.'; exit; }
        git add .gitmodules "$3" || { echo 'Failed at git add .gitmodules.'; exit; }
        echo "Done."
        git commit
    fi
}

function remove_plugin()
{
    if [ $# -lt 2 ]
    then
        echo "Usage $0 remove <destination>"
    else
        echo "Removing $2..."
        git submodule deinit -f "$2" || { echo 'Failed at git submodule deinit.'; }
        git rm -rf "$2" || { echo 'Failed at git rm.'; exit; }
        rm -rf ".git/modules/vim/$2"
        echo "Done."
        git commit
    fi
}

function update_plugins()
{
    echo "Updating all plugins..."
    git submodule update --remote --merge || { echo 'Failed to update.'; exit; }
    echo "Done."
    git commit
}

function init_plugins()
{
    echo "Initializing all plugins..."
    git submodule init
    echo "Done."
}

function usage()
{
    echo "Usage: $0 add|remove|update|init <git_url> [destination]"
    echo
    echo "    add       Add the plugin at git_url to the destination."
    echo "    remove    Removes the plugin at destination."
    echo "    update    Updates all plugins."
    echo "    init      Initializes all submodules (download them if they are not"
    echo "              already downloaded."
    echo
}

if [ $# -lt 1 ]
then
    usage
    exit
fi

case $1 in
    "add")
        add_plugin $@
        ;;
    "remove")
        remove_plugin $@
        ;;
    "update")
        update_plugins
        ;;
    "init")
        init_plugins
        ;;
    *)
        usage
        ;;
esac

# vim: ft=bash:fdm=marker:fdl=0:fmr={{{,}}}
