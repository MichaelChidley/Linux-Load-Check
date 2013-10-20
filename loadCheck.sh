#!/bin/bash

#Filename:      loadCheck.sh
#Created:       19/10/2013
#Author:        MJC
#Modified:      -
#
#       2013

#Store the command to get the load into a variable
CURRENTLOAD=`uptime | awk -F, '{print $4}' | awk '{print $3}'`

#Create an email variable to hold the recipient email address
EMAIL=""

#Set the max load limit to send email if greater than
MAXLOAD=0.75

#Store the hostname command into a variable
HOSTNAME=`hostname`

if [[ $CURRENTLOAD > $MAXLOAD ]]; then
        echo "High load detected on $HOSTNAME ($CURRENTLOAD)" | mutt -s "Abnormal Load Detected" -- $EMAIL
fi