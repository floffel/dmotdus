#!/bin/bash
#####################################
#/ CAUTION CAUTION CAUTION CAUTION \#
##				   ##
## this script was HACKED together ##
##    the QUICK 'n DIRTY way	   ## 
##				   ##
## READ it FIRST and DECIDE if you ##
## 	really want to use it	   ##
##                                 ##
#\ CAUTION CAUTION CAUTION CAUTION /#
#####################################

DATE=`date +%d.%m.%Y` # get the current date, used for adding a sample history file 

echo "I warned you.. You should have read the whole Script.. But here I go..."	# yep, warned ya
mkdir -p {/etc/update-motd.d,/etc/history-motd}					# create dir's @/etc
cp ./etc/update-motd.d/* /etc/update-motd.d/				        # copy motd-building-files 
cp ./usr/lib/systemd/system/update-motd.* /usr/lib/systemd/system/	        # copy systemd startuo files
cp ./usr/bin/update-motd /usr/bin					        # copy main executable file
chmod +x {/usr/bin/update-motd, chmod +x /etc/update-motd.d/*}							# make the main file executable
echo "-> Installed dynamic motd update system" > /etc/history-motd/current	# add sample history file 
echo "NOTES: Edit me @ /root/notes.txt" > /root/notes.txt # add notes file
echo "Starting Service now..."							# give the user a heads-up
systemctl start update-motd							# start the dmotdus
echo "Finished installing.. Please run manually for running update-motd at start-up:"
echo "$ systemctl start update-motd"
