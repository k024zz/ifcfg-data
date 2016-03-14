# ifcfg-data

NAME
     
	ifcfg-data -- extract data from ifconfig output

SYNOPSIS
     
     ifcfg-data [-imn]

DESCRIPTION

	The ifcfg-data tool extract data from the output of the ifconfig(8) command.

   	ifcfg-data reads data from stdin and prints output to stdout.

OPTIONS

     ifcfg-data accepts the following command-line flags:

     -i  Print all IP addresses.

     -m  Print all MAC addresses.

     -n  Print all netmasks.

EXAMPLES
     Sample invocation and output:

     $ ifconfig -a
     lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
	     options=3<RXCSUM,TXCSUM>
	     inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
	     inet 127.0.0.1 netmask 0xff000000
	     inet6 ::1 prefixlen 128
     gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
     stf0: flags=0<> mtu 1280
     en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	     ether 98:fe:94:46:f4:44
	     inet6 fe80::9afe:94ff:fe46:f444%en0 prefixlen 64 scopeid 0x4
	     inet 192.168.1.2 netmask 0xffffff00 broadcast 192.168.1.255
	     inet6 2001:470:1f07:2c0:9afe:94ff:fe46:f444 prefixlen 64 autoconf
	     inet6 2001:470:1f07:2c0:1834:f67:2271:a5eb prefixlen 64 autoconf temporary
	     media: autoselect
	     status: active
     p2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304
	     ether 0a:fe:94:46:f4:44
	     media: autoselect
	     status: inactive
     $ ifconfig -a | ifcfg-data -i
     fe80::1
     127.0.0.1
     ::1
     fe80::9afe:94ff:fe46:f444
     192.168.1.2
     2001:470:1f07:2c0:9afe:94ff:fe46:f444
     2001:470:1f07:2c0:1834:f67:2271:a5eb
     $ ifconfig -a | ifcfg-data -m
     98:fe:94:46:f4:44
     0a:fe:94:46:f4:44
     $ ifconfig -a | ifcfg-data -n
     0xff000000
     0xffffff00
     $

EXIT STATUS
     
     The ifcfg-data utility exits 0 on success, and >0 if an error occurs.

SEE ALSO
     
     awk(1), grep(1), sed(1), ifconfig(8)

HISTORY
     
     ifcfg-data was originally assigned by Jan Schaumann
     <jschauma@stevens.edu> as a homework assignment for the class "Aspects of
     System Administration" at Stevens Institute of Technology in the Spring
     of 2013.