#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# My Telegram : https://t.me/FER1DEV
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
akbarvpn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/ssh"
# Link Hosting Kalian Untuk Sstp
akbarvpnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/sstp"
# Link Hosting Kalian Untuk Ssr
akbarvpnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
akbarvpnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
akbarvpnnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/wireguard"
# Link Hosting Kalian Untuk Xray
akbarvpnnnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/xray"
# Link Hosting Kalian Untuk Ipsec
akbarvpnnnnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/ipsec"
# Link Hosting Kalian Untuk Backup
akbarvpnnnnnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/backup"
# Link Hosting Kalian Untuk Websocket
akbarvpnnnnnnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/websocket"
# Link Hosting Kalian Untuk Ohp
akbarvpnnnnnnnnnn="https://raw.githubusercontent.com/ferr1122/scriptvps/main/ohp"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/ferr1122/perizinan/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : awaludin feriyanto
echo -e "${NC}${LIGHT}WhatsApp : 088228877739"
echo -e "${NC}${LIGHT}Telegram : https://t.me/FER1DEV"
exit 0
fi
rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/akbarstorevpn;
echo "IP=" >> /var/lib/akbarstorevpn/ipvps.conf
wget https://${akbarvpn}/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://${akbarvpn}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://${akbarvpnn}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://${akbarvpnnn}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://${akbarvpnnnn}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://${akbarvpnnnnn}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
wget https://${akbarvpnnnnnn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install L2TP
wget https://${akbarvpnnnnnnn}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://${akbarvpnnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
wget https://${akbarvpnnnnnnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
wget https://${akbarvpnnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/Akbar218

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${akbarvpn}/set.sh"
chmod +x /etc/set.sh
history -c
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
