#"/bin/bash

#COLORES
BLANCO="\e[38m"
AZUL="\e[34m"
VERDE="\e[32m"
ROJO="\e[31m"
AMARILLO="\e[33m"
RESET="\e[0m"
verde='\033[38;5;148m'
bar="----------------------------------------"
bar="${ROJO}=========================================="
bar="${VERDE}════════════════════════════════════════════════════"
#------------------------------------------------------------------------------
#ESTILOS DE TEXTO
#------------------------------------------------------------------------------
#PATH DE ARCHVOS
dir_token=/etc/token
file_token=$dir_token/BD
file_pass=$dir_token/.passw
file_client=$dir_token/.clientes
#DIRECTORIOS
mkdir_dir (){
  if [ -d $dir_token ]; then
	    echo
	    else
	     mkdir $dir_token
fi
if [ -f $file_token ]; then
	    echo
	    else
	     touch $file_token
       chmod 755 $file_token
fi
if [ -f $file_pass ]; then
	    echo
	    else
	     touch $file_passw
       chmod 755 $file_pass
fi
if [ -f $file_client ]; then
	    echo
	    else
	     touch $file_client
       chmod 755 $file_client
fi
}
#--------------------------------------------------------------------------------
#HORA DE MEXICO
echo "America/Mexico_City" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
#--------------------------------------------------------------------------------
#FUENTES
#--------------------------------------------------------------------------------
#VARIABLES
numero="0"
opcion="ACTIVAR WS-EPR"
#echo ""= genera un espacio entre una linea y otra
#--------------------------------------------------------------------------------
#TITULO
display_header() {
clear
echo -e $bar
echo -e  "${VERDE}       == Token Auth == By @HellBoyVps         ${RESET}"
echo -e $bar
}
#-------------------------------------------------------------------------------
#MENU PRINCIPAL
menu_principal() {
  display_header
  echo -e "${VERDE}TOTAL DE REGISTROS: ${ROJO}>${RESET} ${azul}  ID : ${blanco}$No_token  ${RESET}"
  echo -e $bar
	echo -e "${AZUL}[1] > ${BLANCO} DEFINE PASS TOKEN AUTH ${RESET}"
	echo -e "${AZUL}[2] > ${BLANCO} CREAR USUARIO ${RESET}"
	echo -e "${AZUL}[3] > ${BLANCO} ELIMINAR USER TOKEN ${RESET}"
  echo -e "${BLANCO}[4] > ${VERDE} EDITAR USUARIOS ${RESET}"
	echo -e "${BLANCO}[5] > ${VERDE} LISTA DE USUARIOS REGISTRADOS ${RESET}"
	echo -e "${BLANCO}[6] > ${ROJO} ELIMINAR USUARIOS EXPIRADOS ${RESET}"
  echo -e "${BLANCO}[7] > ${VERDE} INFORMACION DE USUARIOS ${RESET}"
  echo -e "${BLANCO}[8] > ${VERDE} USUARIOS ONLINE ${RESET}"
  echo -e "${BLANCO}[0] > ${VERDE} SALIR DEL MENU ${RESET}"
	echo -e  $bar
	read -p "Ingrese una opcion: " option

	case $option in 
		1) define ;;
		2) crear ;;
		3) eliminar ;;
    4) editar ;;
    5) lista ;;
    6) expirados ;;
    7) informacion_clientes ;;
    8) online ;;
		0) exit ;;
		*)echo -e "${ROJO} Ingrese una opcion valida..." ;;
	esac
if [ -f $file_pass ]; then
	    echo
	    else
    define
fi
  echo -e $bar
	echo -e "${BLANCO} Enter para continuar"
	read -r Enter
	menu_principal
}
#-------------------------------------------------------------------------
#DEFINE CONTRASEÑA UNICA
define (){
  clear
	mkdir_dir
echo -e "$bar"
echo -e "${BLANCO}Antes de comenzar deve ingresar su contraseña"
echo -e "$bar"
read -p "$(echo -e "${VERDE}[ingrese]: ${RESET}")" pass
echo -e "$pass" >> $file_pass
echo -e $bar
echo -e "${BLANCO} Enter para continuar"
read -r Enter
menu_principal
}
#------------------------------------------------------------------------
#FUNCION DE CREACION DE USUARIOS
crear () {
    clear
TITLE="${blanco}HELLBOY ${verdeR}VPS"
echo -e         "$TITLE"
echo -e ""
echo -e " AUTORIZAR TOKEN ID"
echo -e "$bar"
echo -e ""
echo -e "${blanco}Ingrese el Nombre del Usuario${RESET}"
echo -e "$bar"
read -p $'\e[32m  [ingrese]: \e[0m' usr
echo -e "$bar"
echo -e "${blanco}Ingrese el Token que desea Autorizar${RESET}"
echo -e "$bar"
read -p $'\e[32m  [Token ID]: \e[0m' token

# Check If Username Exist, Else Proceed
egrep "^$token" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
clear
echo -e "$bar"
echo -e "$TITLE"
echo ""
echo -e "\e[31m El Token ya existe en su servidor, intente con otro Token\e[0m."
exit 0
else
echo -e "$bar"
read -p $'\e[32m  Dias activos: \e[0m' Days
echo -e "$bar"
clear
sleep 1
IPADDR=$(wget -4qO- http://ipinfo.io/ip)
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g' )"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g')"
stunnel4port="$(netstat -nlpt | grep -i stunnel4 | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g')"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g')"
pyport="$(netstat -nlpt | grep -i python | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g')"
squidport="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | xargs | sed -e 's/ /, /g')"
useradd -m -s /bin/false -e $Expiration $token > /dev/null
egrep "^$token" /etc/passwd &> /dev/null
DIA=`date +"%d/%m/%Y"`
HORA=`date +"%H:%M"`
echo -e "$(cat $file_pass)\n$(cat $file_pass)\n" | passwd $token &> /dev/null
echo -e "$token" >> $file_token
echo -e "$usr  $token  $DIA     $HORA"  >> $file_client
clear
echo -e "$bar"
echo -e "$TITLE"
echo -e "$bar"
echo -e       "Datos del Usuario"
echo -e "\e[32m  Token ID: \e[0m"$token
echo -e "\e[32m  Caducidad de la cuenta: \e[0m"$Expiration_Display
echo -e "$bar"
echo -e "\e[32m  Host/IP: \e[0m"$IPADDR
echo -e "\e[32m  Perto OpenSSH: \e[0m"$opensshport
echo -e "\e[32m  Puerto Dropbear: \e[0m"$dropbearport
echo -e "\e[32m  Puerto SSL: \e[0m"$stunnel4port
echo -e "\e[32m  Puertos Squid: \e[0m"$squidport
echo -e "\e[32m  Puertos Openvpn: \e[0m"$openvpnport
echo -e "\e[32m  Puertos python: \e[0m"$openvpnport
echo -e $bar
echo -e "${BLANCO} Enter para continuar"
read -r Enter
menu_principal
fi
}
#---------------------------------------------------------------------------------------------------------------------
#ELIMINAR ID
eliminar () {
  clear
  unset token
  echo -e "$TITLE"
echo -e ""
    i=1
	for total in `cat $file_token`; do
	[[ -f "$total" ]] && continue
	option_id[$i]="$total"
    echo -e "$bar"
	echo -e "${azul} [$i] > $blanco$total"
	let i++
    done
	i=$(($i - 1))
    echo -e "$bar"
	while [[ -z ${option_id[$slct_option]} ]]; do
read -p "seleccione [1-$i]: " slct_option
tput cuu1 && tput dl1
done
token="${option_id[$slct_option]}"
sleep 2
egrep "^$token" /etc/passwd &> /dev/null
if [ $? -eq 0 ]; then
  userdel -f $token
  rm -rf /home/$token
  sed -i "s;$token;;g" $file_token
  sed -i '/^$/d' $file_token
  sed -i "/$token/d" $file_client
  sed -i '/^$/d' $file_client
	clear	
  echo -e "$TITLE"
  echo -e "$bar"
	echo -e " Token Eliminado con Exito"
	echo -e "$bar"
else
	clear
  echo -e "$TITLE"
  echo -e "$bar"
	echo -e " El Token que ingresaste no existe"
	echo -e "$bar"
fi
}
#---------------------------------------------------------------------------------
#EDITAR TOKEN
editar (){
unset token
  echo -e "$TITLE"
echo -e ""
    i=1
	for total in `cat $file_token`; do
	[[ -f "$total" ]] && continue
	option_id[$i]="$total"
    echo -e "$bar"
	echo -e "${azul} [$i] > $blanco$total"
	let i++
    done
	i=$(($i - 1))
    echo -e "$bar"
	while [[ -z ${option_id[$slct_option]} ]]; do
read -p "seleccione [1-$i]: " slct_option
tput cuu1 && tput dl1
done
token="${option_id[$slct_option]}"
sleep 2
egrep "^$token" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo -e "${blanco}Ingrese el numero de dias${cierre}"
echo -e "$bar"
read -p " [Días]: " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $token
usermod -e $Expiration $token
egrep "^$token" /etc/passwd >/dev/null
echo -e "$PASSWDT\n$PASSWDT\n"|passwd $token &> /dev/null
clear
echo -e "$TILTE"
echo -e "$bar"
echo -e " token ID: $token"
echo -e "$bar"
echo -e " Caducidad de cuenta modificada: $Days Dias"
echo -e "$bar"
echo -e " La cuenta vence el: $Expiration_Display"
echo -e "$bar"
else
clear
echo -e "$TILTE"
echo -e "$bar"
echo -e " El Token que ingresaste no existe"

fi
}
#--------------------------------------------------------------------------------------------
#MOSTAR USURIOS
lista (){
  clear
	if [ -f /etc/debian_version ]; then
	UIDN=1000
elif [ -f /etc/redhat-release ]; then
	UIDN=500
elif [ -f /etc/ubuntu_version ]; then
	UIDN=500
else
	UIDN=500
fi
clear
echo -e "$TILTE"
echo -e "$bar"
echo -e ""
echo -e " Token ID               Expiracion"
echo -e "$bar"
while read Checklist
do
        Spacer=""
        Account="$(echo $Checklist | cut -d: -f1)"
        ID="$(echo $Checklist | grep -v nobody | cut -d: -f3)"
        Exp="$(chage -l $Account | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge $UIDN ]]; then
        echo -e " $Account   " "   $Exp"
        fi
done < /etc/passwd
No_Users="$(awk -F: '$3 >= '$UIDN' && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$bar"
echo -e " Numero de Tokens: "$No_Users
echo -e "$bar"
}
#-----------------------------------------------------------------------------------------------
#ELIMINAR EXPIRADOS
expirados () {
clear
unset token
echo -e "$TITLE"
echo -e "$bar"

datenow=$(date +%s)
for token in $(awk -F: '{print $1}' /etc/passwd); do
expdate=$(chage -l $token|awk -F: '/Account expires/{print $2}')
echo $expdate | grep -q never && continue
echo -n "Token \`$token' expira el $expdate ... "
expsec=$(date +%s --date="$expdate")
diff=$(echo $datenow - $expsec|bc -l)
echo $diff | grep -q ^\- && echo okay && continue
userdel -r -f $token  &> /dev/null
done
echo -e "  Todos \e[31mLos token expirados\e[0m han sido Eliminados"
echo -e "$bar"
}
#-----------------------------------------------------------------------------------------------
#INFO DE USUARIOS REGISTRADOS
informacion_clientes () {
  clear
  GreenBG="\033[42;31m"
    echo -e "$bar"
    echo -e "${ROJO}                 INFORMACION DE CLIENTES                 ${RESET}"
    echo -e "$bar"
    cat $file_client | column -t

}
#-----------------------------------------------------------------------------------------------
#USUARIOS ONLINE
online (){                                                               
clear
TITLE="${blanco}HELLBOY ${verdeR}VPS"

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
                
data=( `ps aux | grep -i dropbear | awk '{print $2}'`)
GreenBG="\033[42;31m"
     echo -e "${ROJO}        Usuarios ONLINE Dropbear                ${RESET}"
    echo -e "$bar"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt
        NUM=`cat /tmp/login-db-pid.txt | wc -l`
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`
        if [ $NUM -eq 1 ]; then
                echo -e "Token: $USER - ${verdeR}[ON]${RESET} -"
                fi
done
GreenBG="\033[42;31m"
    echo -e "${ROJO}         Usuarios ONLINE OpenSSH                ${RESET}"
    echo -e "$bar"
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/logins-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
for PID in "${data[@]}"
do
        cat /tmp/logins-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo -e "Token: $USER - ${verdeR}[ON]${RESET} -";
        fi
done
if [ -f "/etc/openvpn/openvpn-status.log" ]; then
        line=`cat /etc/openvpn/openvpn-status.log | wc -l`
        a=$((3+((line-8)/2)))
        b=$(((line-8)/2))
        echo -e "${ROJO}          Usuarios ONLINE Openvpn               ${RESET}"
        echo -e "$bar"
        
        cat /etc/openvpn/openvpn-status.log | head -n $a | tail -n $b | cut -d "," -f 1,2,5 | sed -e 's/,/   /g' > /tmp/vpn-login-db.txt
        cat /tmp/vpn-login-db.txt
fi
}
#------------------------------------------------------------------------------------------------------------------------------------------------
No_token="$(cat /etc/token/BD | wc -l)"
#------------------------------------------------------------------------------------------------------------------------------------------------
#LA EJECUCION PRINCIPAL DEL MENU Y EL SCRIPT COMIENZAN ACTIVAR
menu_principal