#! /bin/sh

if [ $UID -ne 0 ] ; then
    echo "You have to be root to run this script"
    exit 1
fi

id=dummyid
pass=dummypass


proxy_string="http://${id}:${pass}@136.18.66.239:83"

#echo "proxy_string=${proxy_string}"

echo "Acquire::http::proxy \"http://${proxy_string}/\"\;
Acquire::https::proxy \"https://${proxy_string}/\"\;
Acquire::ftp::proxy \"ftp://${proxy_string}/\"\;" >/etc/apt/apt.conf.d/99proxies

echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games\"
http_proxy=${proxy_string}
https_proxy=${proxy_string}
ftp_proxy=${proxy_string}
no_proxy=\"jazz.visteon.com:9443/ccm/,localhost,127.0.0.1,10.142.144.96,localaddress,192.168.106.96,192.168.106.98,192.168.106.99,192.168.106.100,10.185.4.252,10.142.144.96,10.185.4.98,10.185.4.99,10.185.4.100,.localdomain.com\"
HTTP_PROXY=${proxy_string}
HTTPS_PROXY=${proxy_string}
FTP_PROXY=${proxy_string}
NO_PROXY=\"jazz.visteon.com:9443/ccm/,localhost,127.0.0.1,10.142.144.96,localaddress,192.168.106.96,192.168.106.98,192.168.106.99,192.168.106.100,10.185.4.252,10.142.144.96,10.185.4.98,10.185.4.99,10.185.4.100,.localdomain.com\"
" > /etc/environment

