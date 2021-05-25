#!/usr/bin/env bash

set -x

echo "run setup jail script"

echo "[+] setup ports"

echo ${USER}

id

portsnap fetch extract

git clone --depth 1 https://github.com/sbz/packaging-freebsd/
cd packaging-freebsd
rm -rf /usr/ports/security/crowdsec 
rm -rf /usr/ports/security/crowdsec-firewall-bouncer
cp -r security/crowdsec /usr/ports/security/
cp -r security/crowdsec-firewall-bouncer /ur/ports/security/

poudriere ports -c -M /usr/ports -f none -p portsdir -m null

echo "[+] setup jail"

poudriere jail -c -j 12amd64 -v 12.2-RELEASE -p portsdir -a amd64 -m ftp

echo "done"
