#!/bin/sh
echo "1"
REPO="https://github.com/gefes7th/marshmallow"
DOWNLOAD_DIR="/tmp/marshmallow"
COUNT=3

rm -rf "$DOWNLOAD_DIR"
mkdir -p "$DOWNLOAD_DIR"

msg() {
    printf "\033[32;1m%s\033[0m\n" "$1"
}
run_main(){
	msg "In process"
	#sudo apt update -y && sudo apt upgrade -y || { echo "sudo apt update -y && sudo apt upgrade -y"; exit 1; }
	#Устанавливаем docker, все приложения будут крутиться в контейнерах 
	# Add Docker's official GPG key:
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	# Add the repository to Apt sources:
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] 	https://download.docker.com/linux/ubuntu \
	  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
 	 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update

	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

 	#Устанавливаем Portainer, это удобный функциональный веб интерфейс для управления контейнерами

	sudo docker volume create portainer_data
	sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts

	#Создаем папку data в корне диска для удобства. Там будут лежать все данные от приложений
	sudo mkdir -p /data/{3x-ui,haproxy,npm/{data,letsencrypt},ocserv}
	sudo chown -R 1000:1000 /data  # Важно для прав доступа
	sudo chmod -R 775 /data        # Права для чтения/записи
 
    msg "Done"
    
}
run_main
