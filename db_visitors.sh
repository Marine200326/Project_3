# 1
apt-get update && apt-get upgrade  
apt-get install -y mysql-server 
systemctl enable mysql
systemctl start mysql
rm -rf /var/www/mysql/* 
touch /var/www/mysql/index.sql 

# 2
mysql -u root -e CREATE DATABASE zoo_db;
mysql -u root -e "USE zoo_db; CREATE TABLE visitors ( ID_visitor INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL, telephone VARCHAR(15), email VARCHAR(255) NOT NULL, subscription_type VARCHAR(50) NOT NULL);"


# 3
mysql -u root -e CREATE DATABASE zoo_animals_db; 
mysql -u root -e "USE zoo_animals_db; CREATE TABLE animals (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL, species VARCHAR(100) NOT NULL, habitat VARCHAR(100), age INT);"

mysql -u root -e "INSERT INTO animals (name, species, habitat, age,) VALUES ('Lion', 'Cat', 'Savannah', 5), ('Elephant', 'Loxodonta africana', 'Grassland', 10);"

mysql -u root -e SELECT * FROM animals; 

