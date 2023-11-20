#!/bin/bash

#########################################################
#                   CONSTANTS                           #
#########################################################
bred='\033[1;31m'
bblue='\033[1;34m'
bgreen='\033[1;32m'
yellow='\033[0;33m'
red='\033[0;31m'
blue='\033[0;34m'
green='\033[0;32m'
reset='\033[0m'
sign_dir="~/.leakey/signatures.json"

#########################################################
#                   Logo                                #
#########################################################
logo(){
printf """  
██╗     ███████╗ █████╗ ██╗  ██╗███████╗██╗   ██╗
██║     ██╔════╝██╔══██╗██║ ██╔╝██╔════╝╚██╗ ██╔╝
██║     █████╗  ███████║█████╔╝ █████╗   ╚████╔╝ 
██║     ██╔══╝  ██╔══██║██╔═██╗ ██╔══╝    ╚██╔╝  
███████╗███████╗██║  ██║██║  ██╗███████╗   ██║   
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝  $bblue v1.0$reset 
═══════ 🔑 Check for the leaked credentials 🔑 ═══════
╔═════════════════════════════════════════════════════╗
   Developed BY: 𝝘𝝝𝝜𝗦𝝨𝗖 (https://twitter.com/rohsec)
╚═════════════════════════════════════════════════════╝
"""

}

#########################################################
#                 Engine Core Logic                     #
#########################################################
main(){
    if [ -z $sign_dir ]
    then
    declare -A x1=()
    printf "\n$bblue═════════$bred Leaks Menu$bblue ═════════\n$reset"
    cat $sign_dir|jq -r '.[] | "\(.id) - \(.name)"'
    printf "\n${bblue}Enter Choice :$bred"
    read choice
    printf "$blue═══════════════════════════════════════"
    if [[ $choice != "" ]] && [[ $choice = ?(-)+([0-9]) ]] && [ $choice -lt $(cat $sign_dir|jq length) ]
    then
    select_choice=$(cat $sign_dir|jq -r --arg choice1 "$choice"  '.['$choice']|.name')
    printf "\n${bblue}Selected Leaks : $bred $select_choice $reset\n\n"
    for i in $(cat $sign_dir|jq -r --arg choice1 "$choice"  '.['$choice']|.args[]')
    do 
    read -rep "[ + ] Enter $i : " zz
    x1[$i]+=$zz
    done
    cmd=$(cat $sign_dir|jq -r --arg choice1 "$choice" '.['$choice'] |.command')
    printf "$blue═══════════════════════════════════════\n"
    for i in ${!x1[@]}
    do
    printf "$bgreen[ ✔ ] $bblue$i $yellow=> $bred${x1[$i]}$reset\n"
    cmd=$(echo $cmd|sed "s|\$$i|${x1[$i]}|g")
    done
    printf "$bgreen[ ✔ ]$bblue Generating POC request...$reset"
    printf "\n$bgreen[ ✔ ]$bblue Performing request...$reset\n"
    sleep 2
    printf "\n${yellow}Request:$blue\n═══════════════════════════════════════$reset"
    printf "\n$cmd"
    resp=$(bash -c "$cmd")
    printf "\n\n${yellow}Response:$blue\n═══════════════════════════════════════$reset"
    printf "\n$resp"
    else
    printf "\n${yellow}Invalid Input!!"
    fi
    else
    printf "\n$bred[ ! ]$yellow No valid signatures found!! Please run installer command first$reset\n\thttps://github.com/rohsec/LEAKY"
    fi
}


#########################################################
#                   Main Script                         #
#                                                       #
#########################################################
logo
main