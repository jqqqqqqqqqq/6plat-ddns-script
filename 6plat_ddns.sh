#!/bin/sh
remote_host="tunnel.6plat.org"  # Required. The remote tunnel endpoint domain.
interface="6plat"  # Required for LEDE/Openwrt. The local interface name in Luci.
method="uci"  # Required. Set to "uci" on LEDE/OpenWRT，set to other if you want to use iproute2
local_ifname="pppoe-wan"  # Required for iproute2. The tunnel's dev inteface name.
tunnel_name="6in4-6plat"  # Required for iproute2. The tunnel's inteface name.

##################### DO NOT EDIT THIS LINE BELOW ##############################

_6plat_ip="$(dig +short $remote_host | grep -E '^[0-9.]+$' | head -n 1)"
if [ $method == "uci" ]; then
    if [ "$(uci get network.$interface.peeraddr)" != "$_6plat_ip" ]; then
        uci set network.$interface.peeraddr="$_6plat_ip"
        uci commit network
        /etc/init.d/network reload
    fi
else
    local=$(ip addr | grep 'state UP' -A2 | grep "scope global "$local_ifname  | awk '{print $2}' | cut -f1  -d'/')
    ip tunnel change $tunnel_name remote $remote
fi
