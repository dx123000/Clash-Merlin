#Clash auto-launch
start-stop-daemon -S -b -x /jffs/clash/clash -m -p /tmp/clash.pid -- -d /jffs/clash/
# ports redirect for clash except port 22 for ssh connection
iptables -t nat -A PREROUTING -p tcp --dport 22 -j ACCEPT
#new
iptables -t nat -N CLASH
#Lan related
iptables -t nat -A CLASH -d 192.168.0.0/16 -j RETURN
#redirect to Clash
iptables -t nat -A CLASH -p tcp -j REDIRECT --to-ports 7890
iptables -t nat -A PREROUTING -j CLASH
#DNS 
iptables -t nat -A PREROUTING -p udp -m udp --dport 5448 -j DNAT --to-destination 192.168.50.1:5450
