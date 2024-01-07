#1-ва точка
apt-get update && apt-get upgrade 
apt-get install -y nginx   
apt-get install git -y
systemctl enable nginx 
cp vfs_website /var/www/project -R
touch /etc/nginx/sites-enabled/project
tee /etc/nginx/sites-available/load_balancer <<EOF
upstream backend {
    server 192.168.56.105:8080;
    server 192.168.56.105:8081;
}

server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://backend;
    }
}
EOF 

ln -s /etc/nginx/sites-available/load-balancer /etc/nginx/sites-enabled/

nginx -t

systemctl restart nginx