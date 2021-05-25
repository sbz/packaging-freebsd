#!/usr/bin/env bash

set -x

echo "run test ports script"

portsnap cron

pkg -vvvv

#git clone --depth 1 https://github.com/sbz/packaging-freebsd/
#cd packaging-freebsd
#rm -rf /usr/ports/security/crowdsec 
#rm -rf /usr/ports/security/crowdsec-firewall-bouncer
#cp -r security/crowdsec /usr/ports/security/
#cp -r security/crowdsec-firewall-bouncer /ur/ports/security/

echo List ports
poudriere ports -l

echo List jails
poudriere jail -l

ls -l1F /usr/ports/security/crowdsec/*
md5 /usr/ports/security/crowdsec/Makefile

ls -l1F /usr/ports/security/crowdsec-firewall-bouncer/*
md5 /usr/ports/security/crowdsec-firewall-bouncer/Makefile

#make -C /usr/ports/security/crowdsec make makesum
#make -C /usr/ports/security/crowdsec-firewall-bouncer make makesum

cd /usr/ports
for origin in "security/crowdsec" "security/crowdsec-firewall-bouncer"; do

    echo "-> Testing ${origin}"

    echo "Dry Run"
    poudriere testport -j 12amd64 -p portsdir -o ${origin} -n

    echo "Full Run"
    poudriere testport -j 12amd64 -p portsdir -o ${origin}

    echo "<- done"
done
