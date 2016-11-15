sed -i -e "s/^SELINUX=enforcing/SELINUXTYPE=targeted/" /etc/selinux/config
yum install  NetworkManager-glib libnm-qt-devel.x86_64 nm-connection-editor.x86_64 libsemanage-python policycoreutils-python

yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion
yum update
yum -y install https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo
yum -y --enablerepo=epel install ansible pyOpenSSL
cd ~
git clone https://github.com/openshift/openshift-ansible
cd openshift-ansible
yum install docker
sed -i '/OPTIONS=.*/c\OPTIONS="--selinux-enabled --insecure-registry 172.30.0.0/16 --log-opt max-size=1M --log-opt max-file=3"' /etc/sysconfig/docker
unmount /home
vgcreate docker-vg /dev/sdb2
echo 'VG=docker-vg' >> /etc/sysconfig/docker-storage-setup
docker-storage-setup
cat /etc/sysconfig/docker-storage
systemctl enable docker
systemctl start docker

nmcli con mod eth0 ipv4.dns "66.171.196.10 130.180.201.164 199.201.106.232 8.8.8.8 8.8.4.4"
systemctl restart network