# Proyecto Ixtapuma

Crear un servidor Centos7 con docker
Va a ser un contenedor en docker con Laravel. Así que hay que instalar Docker

Instalación de Docker:

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

Configuración de docker-ce repo:

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

Instalar docker-ce:

sudo yum install docker-ce

Agregamos al usuario en el grupo de docker:

sudo usermod -aG docker $(whoami)

Ejecutamos que inicie al arranque:

sudo systemctl enable docker.service

Iniciamos el servicio:

sudo systemctl start docker.service

## Instalación Docker-Compose

Instalamos paquetes extras para Enterprise Linux

sudo yum install epel-release  

Instalamos python-pip:

sudo yum install -y python-pip

Instalamos Docker-Compose:

sudo pip install docker-compose

Actualizamos los paquetes de python para Centos 7 para ejecutar correctamente docker-compose:

sudo pip install docker-compose

Verificamos la instalación:

docker-compose version

## Instalación de Laravel
[https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose](sauce)

git clone https://github.com/laravel/laravel.git laravel-app
cd ~/laravel-app
docker run --rm -v $(pwd):/app composer install
sudo chown -R $USER:$USER ~/laravel-app

cp compose.* php/
NOTA: checar esos archivos

docker-compose exec php vi .env
DB_HOST will be your db database container.
DB_DATABASE will be the laravel database.
DB_USERNAME will be the username you will use for your database. In this case, we will use laraveluser.
DB_PASSWORD will be the secure password you would like to use for this user account.

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laraveluser
DB_PASSWORD=your_laravel_db_password

docker-compose exec php php artisan key:generate
docker-compose exec php php artisan config:cache