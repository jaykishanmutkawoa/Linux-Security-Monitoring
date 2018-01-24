#!/bin/bash

# Author Nitin J Mutkawoa
# Email nitin@hackers.mu
# Email jmutkawoa@gmail.com

#Script to perform monitoring on Linux Environment.
#Verification of packet loss

#Some variables here

# Let's say i want to monitor default gateway!!
CheckPing=`ping -c3 192.168.100.1 | tail -2`
PacketLoss=`echo $CheckPing | cut -d"," -f3 | cut -d" " -f2`
PacketDelay=`echo $ping | cut -d"=" -f2 | cut -d"." -f1`

# Okay lets now start... :)

if [ "$PacketLoss" = "100%" ] ; then
 echo There is a problem with the router as it is not responding.
elif [ "$PacketLoss" != "0%" ] ; then
 echo There is some packet loss issues with the router.
else
 if [ "$PacketDelay" -lt 100 ] ; then
 echo The router is responding correctly.
 else
 echo The router seem be reponding very slowly. Please troubleshoot at ICMP level first.
 fi
fi
