#! /bin/bash

#Script by dxthkd (on dc)
# -paid-

col(){
# ColorSet by dxthkd #
RD='\033[0;31m'
GR='\033[0;32m'
OR='\033[0;33m'
BL='\033[0;34m'
PR='\033[0;35m'
CY='\033[0;36m'
LGR='\033[0;37m'
DGR='\033[1;30m'
LRD='\033[1;31m'
LGR='\033[1;32m'
LOR='\033[1;33m'
LBL='\033[1;34m'
LPR='\033[1;35m'
LCY='\033[1;36m'
WHT='\033[1;37m'
}

vars(){
me="$(whoami)"
ippp="$(hostname -i)"
}

loadbanner(){
echo -e " ${LRD}██╗  ██╗    ██╗██████╗     ██╗      ██████╗  ██████╗ ██╗  ██╗██╗   ██╗██████╗"
echo -e " ${LRD}╚██╗██╔╝    ██║██╔══██╗    ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝██║   ██║██╔══██╗"
echo -e " ${LRD} ╚███╔╝     ██║██████╔╝    ██║     ██║   ██║██║   ██║█████╔╝ ██║   ██║██████╔╝"
echo -e " ${LRD} ██╔██╗     ██║██╔═══╝     ██║     ██║   ██║██║   ██║██╔═██╗ ██║   ██║██╔═══╝"
echo -e " ${LRD}██╔╝ ██╗    ██║██║         ███████╗╚██████╔╝╚██████╔╝██║  ██╗╚██████╔╝██║"
echo -e " ${LRD}╚═╝  ╚═╝    ╚═╝╚═╝         ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝"
}

mainbanner(){
echo -e "   ${LCY}▒██   ██▒   ${LRD} ██▓ ██▓███ v0.2"
echo -e "   ${LCY}▒▒ █ █ ▒░   ${LRD}▓██▒▓██░  ██▒"
echo -e "   ${LCY}░░  █   ░   ${LRD}▒██▒▓██░ ██▓▒"
echo -e "   ${LCY} ░ █ █ ▒    ${LRD}░██░▒██▄█▓▒ ▒"
echo -e "   ${LCY}▒██▒ ▒██▒   ${LRD}░██░▒██▒ ░  ░"
echo -e "   ${LCY}▒▒ ░ ░▓ ░   ${LRD}░▓  ▒▓▒░ ░  ░"
echo -e "   ${LCY}░░   ░▒ ░   ${LRD} ▒ ░░▒ ░"
echo -e "   ${LCY} ░    ░     ${LRD} ▒ ░░░"
echo -e "   ${LCY} ░    ░     ${LRD} ░"
}

ins(){
#--termux part--
#apt update
#apt upgrade
#apt install bash
#apt install pv
sleep 1
clear
sudo apt update
sudo apt upgrade
sudo apt install bash
sudo apt install pv
}

menuload(){
clear
loadbanner
echo -e "\n ${RD}[${LOR}!${RD}] ${OR}Starting up menu..."
sleep 1
echo -e "\n ${RD}[${LOR}!${RD}] ${OR}Checking package installations..."
sleep 1
sleep 2 #idk why this is here
echo -e " ${RD}[${LOR}#${RD}] ${OR}Bash working."
sleep 1
echo -e " ${RD}[${LOR}#${RD}] ${OR}pv installed."
sleep 3
echo -e "\n ${RD}[${LOR}!${RD}] ${OR}All packages are working."
sleep 2
echo -e " ${RD}[${LOR}!${RD}] ${OR}Redirecting..."
sleep 3
}

#  ╭╮
#  │
#  ╰─╯ need this haha


main0(){
clear
echo ""
mainbanner
echo
echo -e "    ${LCY}<Options>   Welcome ${CY}${me}"
echo -e " ${LRD}╭─────────────────────────────╮"
echo -e " ${LRD}│ ${CY}1 ${RD}== ${LCY}Show own IP            ${LRD}│"
echo -e " ${LRD}│ ${CY}2 ${RD}== ${LCY}IP Lookup              ${LRD}│"
echo -e " ${LRD}│ ${CY}3 ${RD}== ${LCY}Reload menu (for bugs) ${LRD}│"
echo -e " ${LRD}│ ${CY}4 ${RD}== ${LCY}Exit                   ${LRD}│"
echo -e " ${LRD}╰─────────────────────────────╯"
echo ""
echo -n -e "   ${LRD}[${LCY}#op${LRD}]───> ${WHT}"
read option

#ifs
if [ "${option}" == "1" ]
then
showip
elif [ "${option}" == "2" ]
then
lookup
elif [ "${option}" == "3" ]
then
main0
elif [ "${option}" == "4" ]
then
exit
else
echo ''
echo -e " ${RD}Ivalid option ${WHT}(${option})${RD}..."
sleep 3
main0
fi
}

showip(){
echo ""
echo -e " ${LOR}Your Host-IP ${LRD}| ${LCY}${ippp}"
echo -e " ${DGR}Press any key to go back..."
read
main0
}

lookup(){
clear

echo ''
echo -e -n " ${CY}Enter IP: ${WHT}"
read useripaddress
echo ''

ipaddripapico=$(curl -s "https://ipapi.co/$useripaddress/json" -L)

ipaddripapicom=$(curl -s "http://ip-api.com/json/$useripaddress" -L)

userip=$(echo $ipaddripapico | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')

usercity=$(echo $ipaddripapico | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

useregion=$(echo $ipaddripapico | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

usercountry=$(echo $ipaddripapico | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

userlat=$(echo $ipaddripapicom | grep -Po '(?<="lat":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

userlon=$(echo $ipaddripapicom | grep -Po '(?<="lon":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

usertime=$(echo $ipaddripapicom | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

userpostal=$(echo $ipaddripapicom | grep -Po '(?<="zip":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

userisp=$(echo $ipaddripapico | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

userasn=$(echo $ipaddripapico | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

usercountrycode=$(echo $ipaddripapico | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

usercurrency=$(echo $ipaddripapico | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

userlanguage=$(echo $ipaddripapico | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

usercalling=$(echo $ipaddripapico | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

printf "   Ip Address     | $userip\n"

printf "   City           | $usercity\n"

printf "   Region         | $useregion\n"

printf "   Country        | $usercountry\n"

printf "\n"

printf "   Latitude       | $userlat\n"

printf "   Longitude      | $userlon\n"

printf "   Timezone       | $usertime\n"

printf "   Posta Code     | $userpostal\n"

printf "   ISP            | $userisp\n"

printf "   ASN            | $userasn\n"

printf "   Country Code   | $usercountrycode\n"

printf "\n"

printf "   Currency       | $usercurrency\n"

printf "   Language       | $userlanguage\n"

printf "   Calling Code   | $usercalling\n"

printf "   GOOGLE Maps    | https://maps.google.com/?q=$userlat,$userlon\n"

printf "\n"

echo -e " ${LOR}0 to go back.   <>   1 to exit"
echo -e -n "   ${OR}[]> ${WHT}"
read ipop

if [ "${ipop}" == "0" ]
then
main0
else
exit
fi
}

col
vars
main0
