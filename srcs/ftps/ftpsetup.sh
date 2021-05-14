adduser forftp --disabled password
echo "forftp:forftp" | chpasswd
mkdir ftp
chmod 777 ftp
chown nobody:nogroup /ftp
chown forftp:forftp /ftp
echo "forftp" >> /etc/vsftpd/vsftpd.userlist

vsftpd /etc/vsftpd/vsftpd.conf