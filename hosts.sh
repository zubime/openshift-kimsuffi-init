rm ~/.ssh/known_hosts
for host in master.sportiventure.com node1.sportiventure.com node2.sportiventure.com; do ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R $host; done
for host in root@master.sportiventure.com root@node1.sportiventure.com root@node2.sportiventure.com; do ssh-copy-id -i ~/.ssh/id_rsa.pub $host; done


