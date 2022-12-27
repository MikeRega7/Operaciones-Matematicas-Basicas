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

function ctrl_c(){
  echo -e "\n\n{redColour}[!] Saliendo...${endColour}\n"
  tput cnorm && exit 1
}
#Ctrl+c
trap ctrl_c INT
toilet -f future "By MRega7"

#Panel de ayuda
function helpPanel(){
  echo -e "\n${yellowColour}[+]Operaciones basicas${endColour}"
  echo -e "\n${yellowColour}s)${endColour}${grayColour} Para hacer una suma de 2 numeros enteros${endColour}"
  echo -e "\n${yellowColour}r)${endColour}${grayColour} Para hacer una resta de 2 numeros enteros${endColour}"
  echo -e "\n${yellowColour}m)${endColour}${grayColour} Para hacer una multiplicacion de 2 numeros enteros${endColour}"
  echo -e "\n${yellowColour}d)${endColour}${grayColour} Para hacer una division de 2 numeros enteros${endColour}"
}
function suma2(){
  # Pide al usuario que ingrese dos números enteros
  echo -en ${blueColour}"Ingresa el primer número: "${endColour}
  read num1
  echo -en ${blueColour}"Ingresa el segundo número: "${endColour}
  read num2
  echo -e ${blueColour}"Suma:${endColour} ${grayColour}$((num1 + num2))${endColour}"
  echo -e ${redColour}"Gracias por usar el script espero haberte ayudado xd"
}
function resta2(){
  #Pide al usuario que ingrese 2 numeros enteros
  echo -en ${blueColour}"Ingresa el primer numero: "${endColour}
  read num1
  echo -en ${blueColour}"Ingresa el segundo numero: "${endColour}
  read num2
  echo -e ${blueColour}"Resta:${endColour} ${grayColour}$((num1 - num2))${endColour}"
  echo -e ${redColour}"Gracias por usar el script espero haberte ayudado xd"
}
function multi2(){
  echo -en ${blueColour}"Ingresa el primer numero: "${endColour}
  read num1
  echo -en ${blueColour}"Ingresa el segundo numero: "${endColour}
  read num2
  echo -e ${blueColour}"Multiplicacion:${endColour} ${grayColour}$((num1 * num2))${endColour}"
  echo -e ${redColour}"Gracias por usar el script espero haberte ayudado xd"
}
function divi2(){
  echo -en ${blueColour}"Ingresa el primer numero: "${endColour}
  read num1
  echo -en ${blueColour}"Ingresa el segundo numero: "${endColour}
  read num2
  echo -e ${blueColour}"Division:${endColour} ${grayColour}$((num1 / num2))${endColour}"
  echo -e ${redColour}"Gracias por usar el script espero haberte ayudado xd"
}
#menu
declare -i parameter_counter=0
while getopts "srmdh" arg; do
  case $arg in
    s) suma="$OPTARG"; let parameter_counter+=1;;
    r) resta="$OPTARG"; let parameter_counter+=2;;
    m) multiplicacion="$OPTARG"; let parameter_counter+=3;;
    d) division="$OPTARG"; let parameter_counter+=4;;
    h);;
  esac
done

if [ "$parameter_counter" = 1 ]; then
  suma2 $suma
elif [ "$parameter_counter" -eq 2 ]; then
  resta2 $resta
elif [ "$parameter_counter" -eq 3 ]; then
  multi2 $multiplicacion
elif [ "$parameter_counter" -eq 4 ]; then
  divi2 $division
else
  helpPanel
fi

