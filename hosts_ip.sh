ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R 5.196.73.54
ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R 176.31.121.211
ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R 5.196.68.4
ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R master.sportiventure.com
ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R node1.sportiventure.com
ssh-keygen -f "/home/fmatuszewski/.ssh/known_hosts" -R node2.sportiventure.com
for host in  root@176.31.121.211 root@5.196.73.54 root@5.196.68.4 ; do ssh-copy-id -i ~/.ssh/id_rsa.pub $host; done