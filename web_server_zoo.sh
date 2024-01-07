#1-ва точка
apt-get update && apt-get upgrade  # "apt-get update" updates the package index files, whereas "apt-get upgrade" upgrades the actual packages installed on your system
apt-get install -y apache2  
systemctl enable apache2 
rm -rf /var/www/html/*  # remove directories and their contents recursively
touch /var/www/html/index.html # updates the dates related to the directory or file  
touch /var/www/html/web_visitors.html 
touch /var/www/html/web_animals.html
