#!/bin/bash
<<help
this is shell script to take backup
can be used with cron
help


<<info

this shell script will take periodic backups 
any folder daily work but daily backup folder me store mate script
eg.
./backup.sh <source> <dest>
src /home/ubuntu/scripts
dest /home/ubuntu/backup
info

src=$1 # source folder (what you want to backu in folder) /home/vagrant/linux/script
dest=$2 # destinaion folder (where the zip will be saved) /home/vagrant/linux/script/backups

timetamp=$(date '+%Y-%m-%d')

zip -r "$dest/backup-$timetamp.zip" $src > /dev/null

echo "backup complated"


 
