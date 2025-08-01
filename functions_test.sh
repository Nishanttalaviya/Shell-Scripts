#!/bin/bash

<<info

this is an explations of functions
info

function create_user {
read -p "enter th username:" username
sudo useradd -m $username

echo "usr created successfullay"
}
create_user
