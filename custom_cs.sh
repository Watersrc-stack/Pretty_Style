#!/bin/bash

summarize(){
    echo -e "\n\e[4;34mSUMMARY\e[0m\n"
    cat coding-style-reports.log | cut -d ' ' -f 2 coding-style-reports.log | sort | uniq -c | sort -nr | awk '{c="\033["; if($1<11)c=c"33m"; else if($1<21)c=c"38;5;214m"; else if($1<31)c=c"31m"; else if($1<51)c=c"1;31m"; else if($1<75)c=c"1;31;4m"; else c=c"1;31;5;4m";print"   "c$1" "$2"\033[0m"}'
}

~/my_scripts/coding-style.sh . . && clear
num=$(cat coding-style-reports.log | wc -l)

if (( $num == 0 )); then
    echo -e "\n   \e[32mNo style errors.\e[0m"
    rm -f coding-style-reports.log
else
    if (( $num < 11)); then
        # echo in yellow
        echo -e "\e[34mYou have \e[31m$num\e[34m style errors.\e[0m\n"
        summarize
        echo -e "\n\e[0m"
        cat coding-style-reports.log | awk '{if (substr($2, 1, 5) == "MINOR") print "  " substr($1, 1, length($1)-1) "\033[34m" substr($0, length($1)+1) "\033[0m"; else print "  " substr($1, 1, length($1)-1) "\033[31m" substr($0, length($1)+1) "\033[0m"}'
        echo -e "\e[0m"
        exit 0
    elif (( $num < 21 )); then
        # echo in orange (red + yellow)
        echo -e "\e[38;5;214mYou have \e[31m$num\e[38;5;214m style errors.\e[0m\n"

        # copilot I love u <3
        # don't ask me how it works, I don't know
        summarize
        echo -e "\n\e[0m"
        cat coding-style-reports.log | awk '{if (substr($2, 1, 5) == "MINOR") print "  " substr($1, 1, length($1)-1) "\033[38;5;214m" substr($0, length($1)+1) "\033[0m"; else print "  " substr($1, 1, length($1)-1) "\033[31m" substr($0, length($1)+1) "\033[0m"}'
        echo -e "\e[0m"
        exit 0
    fi
    color=""
    if (( $num < 31 )); then
        color="31"
    elif (( $num < 51 )); then
        color="1;31"
    elif (( $num < 75 )); then
        color="1;31;4"
    else
        color="1;31;5;4"
    fi
    echo -e "\e[$color""mYou have $num style errors.\e[0m"
    summarize
fi
