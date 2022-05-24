echo "Instalando herramientas basicas " VIM, NET-TOOLS, WGET"
sudo -i
yum install wget vim net-tools -y

echo "Configurando el IP forwarding...."
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

echo "Inciando servicio de firewall..."
service firewalld start
chkconfig firewalld on

echo "configurando interfaz interna y reglas: eth1"
firewall-cmd --permanent --zone=internal --add-interface=eth1
firewall-cmd --permanent --zone=internal --add-service=http 
firewall-cmd --permanent --zone=internal --add-port=80/tcp 
firewall-cmd --permanent --zone=internal --add-port=8080/tcp 
firewall-cmd --permanent --zone=internal --add-masquerade
firewall-cmd --permanent --zone=internal --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.2
firewall-cmd --permanent --zone=internal --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.2

echo "configurando interfaz publica y reglas: eth2"
firewall-cmd --permanent --zone=public --add-interface=eth2

firewall-cmd --permanent --zone=public --add-service=http 
firewall-cmd --permanent --zone=public --add-port=80/tcp 
firewall-cmd --permanent --zone=public --add-port=8080/tcp 
firewall-cmd --permanent --zone=public --add-masquerade

firewall-cmd --permanent --zone=public --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.2
firewall-cmd --permanent --zone=public --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.2
firewall-cmd --reload


