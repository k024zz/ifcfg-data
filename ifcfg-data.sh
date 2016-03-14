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
	flag=`echo $1 | grep '^-[imn]$'`
	if [ $flag = "-i" ]
	then
		grep '.*inet' | sed 's/%/ /g' | awk '{print $2}'
	elif [ $flag = "-m" ]
	then
		grep '.*ether' | awk '{print $2}'
	elif [ $flag = "-n" ]
	then
		grep '.*[mM]ask' | awk '{print $4}'
	else
		help
	fi
	exit 0
fi

help
