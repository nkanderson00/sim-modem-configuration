#!/bin/sh -

#ifconfig wlan0 down

mbim-network /dev/cdc-wdm0 start

ip_info=$(mbimcli -d /dev/cdc-wdm0 -p --query-ip-configuration)

ip_addr=$(echo $ip_info | awk '{print $11}' | sed  's/^.//;s/.$//')

gateway=$(echo $ip_info | awk '{print $13}' | sed 's/^.//;s/.$//')

mtu=$(echo $ip_info | awk '{print $21}' | sed 's/.//;s/.$//')

echo "ipv4: $ip_addr"

echo "gateway: $gateway"

echo "mtu: $mtu"

ip addr flush dev wwan0

ip -6 addr flush dev wwan0

ip link set wwan0 up

ip addr add "$ip_addr" dev wwan0 broadcast +

ip route add default via "$gateway" dev wwan0

ip link set mtu "$mtu" dev wwan0

echo "If the ping works, everything was set up correctly."

ping -c 4 8.8.8.8

