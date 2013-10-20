#!/bin/bash

#Filename:      loadCheck.sh
#Created:       19/10/2013
#Author:        MJC
#Modified:      -
#
#       2013

#Store the command to get the load into a variable
CURRENTLOAD=`uptime | awk -F, '{print $4}' | awk '{print $3}'`

#Top load processes
TOPLOAD=`ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10`

#Create an email variable to hold the recipient email address
EMAIL=""

#Set the max load limit to send email if greater than
MAXLOAD=0.50

#Store the hostname command into a variable
HOSTNAME=`hostname`

if [[ $CURRENTLOAD > $MAXLOAD ]]; then
        echo "High load detected on $HOSTNAME ($CURRENTLOAD) 

$TOPLOAD" | mutt -s "Abnormal Load Detected" -- $EMAIL
fi