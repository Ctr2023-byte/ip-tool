#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
while true; do
  echo -e "\n\n${purpleColour}[+]${endColour}${purpleColour}==========${endColour}${greenColour}IP TOOL${endColour}${purpleColour}==========${endColour}${purpleColour}[+]${endColour}"
  echo -e "\n${redColour}<----${endColour}${grayColour} Cesar Tinajero Rojas ${endColour}${redColour}---->${endColour}"
  echo -e "${yellowColour}---------------------------------${endColour}"
  echo -e "\n${yellowColour}[1]${endColour} ${grayColour}Mostrar IP privada:${endColour} "
  echo -e "\n${yellowColour}[2]${endColour} ${grayColour}Mostrar IP publica:${endColour} "
  echo -e "\n${yellowColour}[3]${endColour} ${grayColour}Mostrar nombre del host:${endColour} "
  echo -e "\n${yellowColour}[4]${endColour} ${grayColour}Mostrar gateway:${endColour} "
  echo -e "\n${yellowColour}[5]${endColour} ${grayColour}Salir${endColour} "
  echo ""
  echo -e "${purpleColour}----->>${endColour} ${greenColour}Selecciona la opcion:${endColour} \c"
  read opcion

#Case
  case $opcion in 
    1)
      echo -e "\n${grayColour}IP Privada:${endColour} ${yellowColour}$(hostname -I | awk '{print$1}')${endColour}"
      ;;
    2)
      echo -e "\n${grayColour}IP Publica:${endColour} ${yellowColour}$(curl -s https://ipinfo.io/ip)${endColour}"
      ;;
    3)
      echo -e "\n${grayColour}Nombre del Host:${endColour} ${yellowColour}$(hostname)${endColour}"
      ;;
    4)
      echo -e "\n${grayColour}Gateway:${endColour} ${yellowColour}$(ip route | grep default | awk '{print $3}')${endColour}"
      ;;
    5)
      echo -e "\n${blueColour}Saliendo...${endColour}"
      sleep 2
      break
      ;;
    *)
      echo -e "\n${redColour}[x]${endColour}${grayColour} Opcion Invalida${endColour}"
  esac
  
  echo ""
  echo -e "${greenColour}Presiona Enter para continuar${endColour}"
  read 
  clear

done


