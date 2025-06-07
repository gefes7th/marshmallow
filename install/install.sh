#!/bin/sh

REPO="https://api.github.com/repos/itdoginfo/podkop/releases/latest"
DOWNLOAD_DIR="/tmp/podkop"
COUNT=3

rm -rf "$DOWNLOAD_DIR"
mkdir -p "$DOWNLOAD_DIR"

printf "NockNock"
