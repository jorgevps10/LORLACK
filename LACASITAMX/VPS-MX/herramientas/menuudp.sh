#!/bin/bash
#20/12/2023
#UDP PROTOCOLO

tput clear

### MENU ADM By @ZubZer3
psimen () {
tput clear  
echo
msg -bar
echo -e "\033[1;32m       MENU VIP UDP CUSTOM By @ZubZer3       \033[0m"
msg -bar
echo -e "\033[1;32m [1] \033[1;33mINSTALAR UDP CUSTOM \033[0m"
echo -e "\033[1;32m [2] \033[1;33mINICIAR PANEL ADM CUSTOM \033[0m"
echo -e "\033[1;32m [3] \033[1;33mDESINSTALAR UDP CUSTOM \033[0m"
#echo -e "\033[1;32m [4] \033[1;33mDESINSTALAR UDP CUSTOM \033[0m"
msg -bar
echo -e "\033[1;32m [0] \033[1;31m SALIR DEL MENU \033[0m"
msg -bar
read -p " SELECIONE UNA OPCION : " opci
case $opci in

1) wget https://raw.githubusercontent.com/jorgevps10/prueba7/main/install.sh && chmod 777 install.sh && ./install.sh
msg -bar
msg -ne "Enter Para Continuar" && read enter
psimen
;;

2) udp ;;

#3) 
#msg -ne "Enter Para Continuar" && read enter
#psimen
#;;

3)
tput clear 
msg -bar
read -rp " $(msg -ama "${a33:-DESEA CONTINUAR CON LA DESINSTALACION? [Y/n]}:") " -e -i Y UNINS
msg -bar
[[ $UNINS != @(Y|y|S|s) ]] && return
systemctl stop udp-custom &>/dev/null
systemctl disable udp-custom &>/dev/null
rm -rf /etc/systemd/system/udp-custom.service
rm -rf /usr/bin/udp-custom
rm -rf /root/udp/udp-custom
rm -rf /root/udp/config.json
rm -rf /etc/UDPCustom/udp-custom
rm -rf /usr/bin/udpgw
rm -rf /etc/systemd/system/udpgw.service
systemctl stop udpgw &>/dev/null 
rm -rf /usr/bin/udp
msg -bar
msg -ne "Enter Para Continuar" && read enter
psimen
;;

0)
return 0
;;

*) psimen;;

esac
}

psimen
