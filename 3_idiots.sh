#!/bin/bash

hero="nishant"
villain="nenis"

echo "3 idioats ka hero $hero hai"

echo "3 idiots ka villain $villain hai"

# shell /enviroment variable bhi hota hai (pre-defind varible)

echo "current loggrd in user $USER" #USER che pre defind variable 

#user input
read -p "rancho ka poora name kya tha" fullname

echo "rancho ka poora name $fullname tha"

#arguments mate je argument hoy te bar print karvi pachi echo thay


# aa badhu bar lakhi pachi print thase, ./3_idiots.sh raju farhan rancho

echo "movie ka naam: $0"

echo "first idiots: $1"

echo "first idiots: $2"

echo "first idiots: $3"

echo "all idiots: $@"

echo " total number of iditos: $#"


