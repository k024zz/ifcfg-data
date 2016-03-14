#!/bin/sh

help()
{
	echo "ifcfg-data: illegal option " 
	echo "SYNOPSIS :" 
	echo "\tifcfg-data [-imn]"
	echo "OPTIONS :"
	echo "\t-i\tPrint all IP addresses."
	echo "\t-m\tPrint all MAC addresses."
	echo "\t-n\tPrint all netmasks."
	exit 2
}     

# check the number of arguments
if [ $# -eq 1 ]
then
	#if [[ $1 =~ ^-[imn]$ ]]
	#flag=`echo $1 | grep '^-[imn]$'`
	if [ $1 = "-i" ]
	then
		reg='.*(inet6?\s|addr:)'
		grep -E $reg | sed -E "s/$reg//g" | sed 's/%/ /p' | awk '{print $1}'
	elif [ $1 = "-m" ]
	then
		reg='.*(ether|HWaddr)'
		grep -E $reg | sed -E "s/$reg ?//g" 
	elif [ $1 = "-n" ]
	then
		reg='.*[mM]ask:?' 
		grep -E $reg | sed -E "s/$reg//g" | awk '{print $1}'
	else
		help
	fi
	exit 0
fi

help
