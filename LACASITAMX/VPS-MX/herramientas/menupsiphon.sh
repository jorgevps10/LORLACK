#!/bin/bash
ll="/usr/local/include/snaps" && [[ ! -d ${ll} ]] && exit
l="/usr/local/lib/sped" && [[ ! -d ${l} ]] && exit
#25/01/2021 by @Kalix1
clear
clear

SCPdir="/etc/VPS-MX"
SCPfrm="${SCPdir}/herramientas" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="${SCPdir}/protocolos" && [[ ! -d ${SCPinst} ]] && exit
declare -A cor=([0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m")

sh_ver="2.0"
amarillo="\e[33m" && bla="\e[1;37m" && final="\e[0m"
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Informacion]${Font_color_suffix}"
Error="${Red_font_prefix}[Error]${Font_color_suffix}"
Tip="${Green_font_prefix}[Atencion]${Font_color_suffix}"

#remove_all(){
#sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
#sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
#echo -e "\e[1;31m ACELERADOR BBR DESINSTALADA\e[0m"
#}

#startbbr(){
#	remove_all
#	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
#	echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
#	sysctl -p
#	echo -e "${Info}¡BBR comenzó con éxito!"
#	msg -bar
#}

#Habilitar BBRplus
#startbbrplus(){
#	remove_all
#	echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
#	echo "net.ipv4.tcp_congestion_control=bbrplus" >> /etc/sysctl.conf
#	sysctl -p
#	echo -e "${Info}BBRplus comenzó con éxito!！"
#	msg -bar
#}

#1-psi 443
installpsi443() {
	cd /root && mkdir psi && cd /root/psi && wget https://raw.githubusercontent.com/Psiphon-Labs/psiphon-tunnel-core-binaries/master/psiphond/psiphond && chmod 777 psiphond && ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-OSSH:80 generate && screen -dmS PSI ./psiphond run && cat /root/psi/server-entry.dat;echo ''
	msg -bar
    msg -verd "$(fun_trans "PSI EN PUERTO 443 INSTALADO")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#2-psi 80
installpsi80() {
	cd /root && mkdir psi && cd /root/psi && wget https://raw.githubusercontent.com/Psiphon-Labs/psiphon-tunnel-core-binaries/master/psiphond/psiphond && chmod 777 psiphond && ./psiphond --ipaddress 0.0.0.0 --protocol FRONTED-MEEK-OSSH:443 generate && screen -dmS PSI ./psiphond run && cat /root/psi/server-entry.dat;echo ''
	msg -bar
    msg -verd "$(fun_trans "PSI EN PUERTO 80 INSTALADO")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#3-iniciar psi
runpsi() {
	cd /root/psi && screen -dmS PSI ./psiphond run
	msg -bar
    msg -verd "$(fun_trans "PSI INICIADO CON EXITO")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#4-obtener codigo de tarjet
codetarjet() {
	cd /root/psi&&cat /root/psi/server-entry.dat;echo ''
	msg -bar
    msg -verd "$(fun_trans "CODIGO TARJET OBTENIDO")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#5-ver puertos activos
activeports() {
	netstat -tnpl
	msg -bar
    msg -verd "$(fun_trans "PUERTOS VISUALIZADOS")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#6-probar velocidad del vps
testspeed() {
	speedtest
	msg -bar
    msg -verd "$(fun_trans "PRUEBA DE VELOCIDAD EJECUTADA")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#7-refrescar memoria ram
cleanram() {
	sync & sysctl -w vm.drop_caches=3
	msg -bar
    msg -verd "$(fun_trans "MEMORIA RAM LIMPIADA")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#8-desinstalar psiphon
unisnstallpsi() {
	rm -rf /root/psi
	msg -bar
    msg -ama "$(fun_trans "PSI DESINSTALADO")!"
	msg -bar
    msg -ne "Enter Para Continuar" && read enter
    ${SCPinst}/menupsiphon.sh

}

#9-ver usuarios conectados
#viewusers() {
	#cd /root/psi&&cat /root/psi/server-entry.dat;echo ''
	#msg -bar
    #msg -ama "$(fun_trans "Intalado con Exito")!"
	#msg -bar
    #msg -ne "Enter Para Continuar" && read enter
    #${SCPinst}/menupsiphon.sh

#}

# Menú de inicio
start_menu(){
clear
msg -bar
msg -tit
echo -e "                \e[47m\e[41mMENU ADM PSIPHON 2\e[0m
$(msg -bar)
 ${Green_font_prefix}[ 1 ]${Font_color_suffix} INSTALAR PSIPHON CON PUERTO 443 ${amarillo}${final}
 ${Green_font_prefix}[ 2 ]${Font_color_suffix} INSTALAR PSIPHON CON PUERTO 80
 ${Green_font_prefix}[ 3 ]${Font_color_suffix} ACTIVAR PSIPHON
 ${Green_font_prefix}[ 4 ]${Font_color_suffix} OBTENER CODIGO TARJET
 ${Green_font_prefix}[ 5 ]${Font_color_suffix} VER PUERTOS ACTIVOS
 ${Green_font_prefix}[ 6 ]${Font_color_suffix} PROBAR VELOCIDAD DEL VPS
 ${Green_font_prefix}[ 7 ]${Font_color_suffix} REFRESCAR MEMORIA RAM
 ${Green_font_prefix}[ 8 ]${Font_color_suffix} DESINSTALAR PSIPHON
 ${Green_font_prefix}[ 0 ]${Font_color_suffix} SALIR DEL SCRIPT" && msg -bar

	#run_status=`grep "psiphond" /root/psi | awk -F "=" '{print $2}'`
	#if [[ ${run_status} ]]; then
	#echo -e " Estado actual: ${Green_font_prefix}Instalado\n${Font_color_suffix} ${_font_prefix}BBR Comenzó exitosamente${Font_color_suffix} Kernel Acelerado, ${amarillo}${run_status}${Font_color_suffix}"
	#else
	#echo -e " Estado actual: ${Green_font_prefix}No instalado\n${Font_color_suffix} Kernel Acelerado: ${Red_font_prefix}Por favor,instale el Acelerador primero.${Font_color_suffix}"
	#fi
msg -bar
read -p "$(echo -e "\e[31m► ${bla}Selecione Una Opcion [0-8]:${amarillo}") " num
case "$num" in
	0) ;;
	1) installpsi443
	sleep 6 ;;
	2) installpsi80
	sleep 6 ;;
	3) runpsi
	sleep 6 ;;
	4) codetarjet
	sleep 6 ;;
	5) activeports
	sleep 6 ;;
	6) testspeed
	 sleep 6;;
	7) cleanram 
	sleep 6;;
	8) unisnstallpsi
	sleep 6 ;;
	#9) viewusers ;;
	*)
	clear
	echo -e "${Error}:Por favor ingrese el número correcto [0-3]"
	sleep 1s
	start_menu 
	;;
esac
}

#check_sys(){
#	if [[ -f /etc/redhat-release ]]; then
#		release="centos"
#	elif cat /etc/issue | grep -q -E -i "debian"; then
#		release="debian"
#	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
#		release="ubuntu"
#	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
#		release="centos"
#	elif cat /proc/version | grep -q -E -i "debian"; then
#		release="debian"
#	elif cat /proc/version | grep -q -E -i "ubuntu"; then
#		release="ubuntu"
#	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
#		release="centos"
 #   fi
#}

#Verifique la versión de Linux
#check_version(){
#	if [[ -s /etc/redhat-release ]]; then
#		version=`grep -oE  "[0-9.]+" /etc/redhat-release | cut -d . -f 1`
#	else
#		version=`grep -oE  "[0-9.]+" /etc/issue | cut -d . -f 1`
#	fi
#	bit=`uname -m`
#	if [[ ${bit} = "x86_64" ]]; then
#		bit="x64"
#	else
#		bit="x32"
#	fi
#}
#check_sys
#check_version
#[[ ${release} != "debian" ]] && [[ ${release} != "ubuntu" ]] && [[ ${release} != "centos" ]] && echo -e "${Error} Este script no es compatible con el sistema actual. ${release} !" && exit 1
start_menu