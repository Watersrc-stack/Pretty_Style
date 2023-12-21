#!/bin/bash

ALIAS="cs"
INSTALL_DIR="$HOME/pretty_style"
SHELL="bash"

install_files(){
    mkdir $INSTALL_DIR 2> /dev/null

    CODING_STYLE_INSTALLED=$(ls $INSTALL_DIR | grep -c "coding-style.sh")
    if [ $CODING_STYLE_INSTALLED -eq 0 ]; then
        cp coding-style.sh $INSTALL_DIR
        chmod +x $INSTALL_DIR/coding-style.sh
    fi

    echo "coding-style.sh -> good"

    PRETTY_STYLE_INSTALLED=$(ls $INSTALL_DIR | grep -c "pretty-style.sh")
    if [ $PRETTY_STYLE_INSTALLED -eq 0 ]; then
        cp pretty-style.sh $INSTALL_DIR
        chmod +x $INSTALL_DIR/pretty-style.sh
    fi

    echo "pretty-style.sh -> good"
}

if [ "$1" = "remove" ]; then
    rm -rf $INSTALL_DIR
    echo "Removed $INSTALL_DIR"
    exit 0
elif [ "$1" = "update" ]; then
    rm -rf $INSTALL_DIR
    echo "Removed $INSTALL_DIR"
    install_files
    echo "Updated $INSTALL_DIR"
    exit 0
else
    echo "Installing $INSTALL_DIR"
fi


ALIAS_INSTALLED=$(cat ~/.$SHELL""rc | grep -c "alias $ALIAS=*")
if [ $ALIAS_INSTALLED -ne 0 ]; then
    echo "You already have $ALIAS installed."
    echo "Please remove the $ALIAS alias from your ~/.$SHELL""rc file and try again."
    exit 1
fi

echo "no alias in rc -> good"

install_files

echo "alias $ALIAS=\"$INSTALL_DIR/pretty-style.sh\"" >> ~/.$SHELL""rc
echo "New alias $ALIAS installed."

sleep 2
clear

echo -e "\n\033[0;32m   Install complete.\033[0m\n"
echo -e "   \033[1;31mDon't forget to restart your terminal\033[0m or \033[1;31msource your rc\033[0m to use the new alias.\n"
