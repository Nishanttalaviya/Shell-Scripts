:wq#!/bin/bash
#multi line comment
<<help

this is a shell script

to create user

help

echo "=========== creation of user ============="

read -p "enter the username:" username

read -p "enter the password:" password


sudo useradd -m -p "$password" "$username"

sudo passwd "$username"

echo -e "$password\n$password" | sudo passwd "$username" --stdin
echo "=========== creation of user compalete ==========="

sudo userdel $username

echo "========== deletion od user completed =========="

cat /etc/passwd | grep $username | wc

echo "as wc is 0 the user is deleted"
