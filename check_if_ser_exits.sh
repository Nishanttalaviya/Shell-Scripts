#!/bin/bash

<<info

this shell script check if user exits

info

read -p "enter the username you wish to check" username

temp=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

echo "$temp"

if [$temp == 0 ];
then
	echo"user does not exists"
else
	echo"user exists"


