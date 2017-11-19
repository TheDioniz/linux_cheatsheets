#!/bin/bash

#Text colours: reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37

#Background colours: reset = 0, black = 40, red = 41, green = 42, yellow = 43, blue = 44, magenta = 45, cyan = 46, and white=47

#text example: echo -e "\e[1;31m This is red text \e[0m"
#background example: echo -e "\e[1;42m Green Background \e[0m"

#TEXT COLOUR VARS

T_RESET="\e[0m\b"
T_BLACK="\e[1;30m\b"
T_RED="\e[1;31m\b"
T_GREEN="\e[1;32m\b"
T_YELLOW="\e[1;33m\b"
T_BLUE="\e[1;34m\b"
T_MAGENTA="\e[1;35m\b"
T_CYAN="\e[1;36m\b"
T_WHITE="\e[1;37m\b"

#BG COLOUR VARS

B_RESET="\e[0m\b"
B_BLACK="\e[1;40m\b"
B_RED="\e[1;41m\b"
B_GREEN="\e[1;42m\b"
B_YELLOW="\e[1;43m\b"
B_BLUE="\e[1;44m\b"
B_MAGENTA="\e[1;45m\b"
B_CYAN="\e[1;46m\b"
B_WHITE="\e[1;47m\b"

#VARS USAGE EXAMPLE:
#echo -e "$T_RED this is red colour $T_YELLOW this is yellow colour $T_RESET"
#echo -e "$B_RED this is red colour $B_YELLOW this is yellow colour $B_RESET"
