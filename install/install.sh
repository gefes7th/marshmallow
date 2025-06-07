#!/bin/sh
echo "1"
REPO="https://github.com/gefes7th/marshmallow"
DOWNLOAD_DIR="/tmp/marshmallow"
COUNT=3

rm -rf "$DOWNLOAD_DIR"
mkdir -p "$DOWNLOAD_DIR"

sudo apt-get update
