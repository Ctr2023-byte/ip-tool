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

echo -e "\n\n${redColour}[+]${endColour}${grayColour}========>> SCANNING OS <<========${endColour}${redColour}[+]${endColour}\n\n"
echo -e "${grayColour}Ingresa la IP a escanear:${endColour} \c"
read ip
#-e "${grayColour}Ingresa la IP a escanear:${endColour} " ip

#Realizamos un ping y extraemos el TTl
ttl=$(ping -c 1 $ip 2>/dev/null | grep ttl | sed -n 's/.*ttl=\([0-9]*\).*/\1/p')

if [[ -z "$ttl" ]]; then
  echo -e "\n${redColour}[+]No se recibio respuesta del host. Verifica que la maquina este encendida${endColour}"
  exit 1
fi 

echo -e "\n\n${greenColour}[+]${endColour} ${grayColour}TTL Detectado${endColour}"

#Identificacion del Sistema Operativo segun el ttl
if [ "$ttl" -le 64 ]; then
  echo -e "${greenColour}[+]${endColour} ${grayColour}Probablemente sea un sistema Linux${endColour}"
elif [ "$ttl" -le 128 ]; then
  echo -e "${greenColour}[+]${endColour} ${grayColour}Probablemente sea un sistema Windows${endColour}"
elif [ "$ttl" -le 255 ]; then
  echo -e "${greenColour}[+]${endColour} ${grayColour}Probablemente sea un dispositivo Cisco u otro${endColour}"
else
  echo -e "${redColour}[!]${endColour} ${grayColour}No se pudo determinar el sistema operativo${endColour}"
fi 

