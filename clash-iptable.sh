start-stop-daemon -S -b -x /jffs/.koolshare/clash -m -p /tmp/clash.pid -- -d /jffs/.koolshare/
iptables -t nat -A PREROUTING -p tcp --dport 22 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -j REDIRECT --to-ports 8887
iptables -t nat -A PREROUTING -p udp -m udp --dport 53 -j DNAT --to-destination 192.168.50.1:55