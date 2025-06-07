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

    msg "In process opkg update"
    sudo apt-get update || { echo "apt-get update"; exit 1; }
    msg "Done opkg update"
    
}
run_main
