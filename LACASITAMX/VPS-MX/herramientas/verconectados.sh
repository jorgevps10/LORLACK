#!/bin/bash

while true; do
  echo "BIENVENIDO AL MENU PARA VER CONECTADOS"
  echo "Seleccione una opción:"
  echo "1. Ver conectados en el puerto 80"
  echo "2. Ver conectados en el puerto 443"
  echo "3. Ver conectados en el puerto 1-600"
  echo "4. Salir"

  read -p "Opción: " opcion

  case $opcion in
    1)
      PSIPHON_PORT_80=$(sudo netstat -tn | awk '$4 ~ /:80$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 80 DE PSIPHON: $PSIPHON_PORT_80"
      ;;
    2)
      PSIPHON_PORT_443=$(sudo netstat -tn | awk '$4 ~ /:443$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 443 DE PSIPHON: $PSIPHON_PORT_443"
      ;;
      3)
      PSIPHON_PORT_1_600=$(sudo netstat -tn | awk '$4 ~ /:1-600$/ {print $5}' | cut -d: -f1 | sort | uniq -c | wc -l)
      echo "CONEXIONES EN EL PUERTO 1-600 DE UDP: $PSIPHON_PORT_1-600"
      ;;
    4)
      echo "Saliendo del script..."
      break
      ;;
    *)
      echo "Opción inválida"
      ;;
  esac

  echo
done
