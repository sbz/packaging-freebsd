#!/usr/bin/env bash

set -o nounset
set -o pipefail

: ${PORTSDIR:="/usr/ports"}

[[ ! -f $(command -v poudriere) ]] && {
    echo poudriere not found, exiting
    exit 1
}

echo "run test ports script"

checkport() {
    local origin="$1"

    echo "-> port ${origin}"
    echo "Makefile(MD5): $(md5 ${PORTSDIR}/${origin}/Makefile)"
    echo "Version: $(make -C ${PORTSDIR}/${origin} -V PORTVERSION)"
}

testport() {
    local origin="$1"

    echo "-> dry"
    poudriere testport -j 12amd64 -p portsdir -o "${origin}" -n

    echo "-> full"
    poudriere testport -j 12amd64 -p portsdir -o "${origin}"
}

main() {
    portsnap cron

    git clone --depth 1 https://github.com/sbz/packaging-freebsd/
    cd packaging-freebsd
    rm -rf ${PORTSDIR}/security/crowdsec 
    rm -rf ${PORTSDIR}/crowdsec-firewall-bouncer
    cp -r security/crowdsec ${PORTSDIR}/security/
    cp -r security/crowdsec-firewall-bouncer ${PORTSDIR}/security/

    echo "-> list ports"
    poudriere ports -l

    echo "-> list jails"
    poudriere jail -l

    checkport "security/crowdsec"
    checkport "security/crowdsec-firewall-bouncer"

    cd "${PORTSDIR}"
    for origin in "security/crowdsec" "security/crowdsec-firewall-bouncer"; do

        echo "-> testing ${origin}"

        testport "${origin}"

        echo "<- done"
    done

    exit 0
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
        main "$@"
fi
