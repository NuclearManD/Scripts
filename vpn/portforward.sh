if [ "$#" -eq 2 ]
then
	sudo iptables -t nat -A PREROUTING -p tcp -i eth0 --dport $2 -j DNAT --to-destination $1:$2
	sudo iptables -A FORWARD -p tcp -d $1 --dport $2 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
else
	echo "Usage: $0 target-ipaddress portnumber"
	exit 1
fi
