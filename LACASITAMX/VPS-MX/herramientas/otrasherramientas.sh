#!/bin/bash
    clear
    echo -e "\033[01;31m║\033[1;31m\033[5;34;47m                 MENU SSH-PLUS PRO                   \033[1;33m \033[0m\033[01;31m║"
    echo -e "\033[01;31m║\033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 01 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR UDP-CUSTOM \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 02 •\033[1;34m]\033[1;37m ➩  \033[1;33mABRIR MENU UDP-CUSTOM \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 03 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR UDP-HYSTERIA(Comando Principal: udph) \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 04 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR SSL TUNNEL PRO\033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 05 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR WS-EPRO\033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 06 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR PROXY-GOLANG \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 07 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR PSIPHON \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 08 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR SLOWDNS \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 09 •\033[1;34m]\033[1;37m ➩  \033[1;33mINSTALAR HYSTERIA-PRO \033[0m"
    echo -e "\033[01;31m║\033[1;31m\033[1;34m[\033[1;37m 00 •\033[1;34m]\033[1;37m ➩  \033[1;33mSAIR  \033[1;32m<\033[1;33m<\033[1;31m< \033[0m"
    echo -e "\033[01;31m║\033[0m"
    echo -e "\033[0;31m╠━━═━═━═━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━═━━═━═━═━═━═━\033[0m"
			tput civis
			echo -ne "\033[1;31m╰━━━━━━━━❪\033[1;32mSELECIONE UMA OPÇÃO\033[1;33m\033[1;31m\033[1;37m : ";
			read x
			tput cnorm
			clear
			case $x in
			1 | 01)
			clear
                        sudo wget https://raw.githubusercontent.com/thefather12/UDP-PRO/main/install.sh; chmod +x install.sh; ./install.sh
			;;
                        2 | 02)
			udp
			;;
                        3 | 03)
                        rm -f install.sh; apt-get update -y; apt-get upgrade -y; wget "https://raw.githubusercontent.com/prjkt-nv404/UDP-Hysteria/main/install.sh" -O install.sh >/dev/null 2>&1; chmod 777 install.sh;./install.sh; rm -f install.sh && udph
                        ;;
                        4 | 04)
                        bash <(curl -sL https://raw.githubusercontent.com/PhoenixxZ2023/SSL-PRO/main/stunnel5.sh)
                        ;;
                        5 | 05)
                        bash <(curl -sL https://raw.githubusercontent.com/PhoenixxZ2023//ws-epro/main/Netcolvip.bin)
                        ;;
			6 | 06)
                        GoLang.sh
                        ;;
                        7 | 07)
                        psiphon.sh
                        ;;
                        8 | 08)
                        slowdns.sh
                        ;;
                        9 | 09)
                        bash <(curl -Ls https://raw.githubusercontent.com/missuo/Hysteria2/main/hy2.sh)
                        ;;
			0 | 00)
			clear
			menu
			;;
			*)
			echo -e "\033[1;31mOpção invalida !\033[0m"
			sleep 2
			;;
			esac

