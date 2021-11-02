#!/usr/bin/env bash

set -o nounset
set -o pipefail

: ${PORTSDIR:="/usr/ports"}
: ${VERSION:="13.0-RELEASE"}
: ${ARCH="amd64"}

[[ ! -f $(command -v poudriere) ]] && {
    echo poudriere not found, exiting
    exit 1
}

main() {
    echo "run setup jail script"

    echo "-> create ports"
    poudriere ports -c -M "${PORTSDIR}" -f none -p portsdir -m null
    poudriere ports -l

    echo "-> create jail"
    jail_name="${VERSION:0:2}${ARCH}"
    poudriere jail -c -j "${jail_name}" \
                      -v "${VERSION}" \
                      -p portsdir \
                      -a "${ARCH}" \
                      -m ftp

    echo "-> update jail"
    poudriere jail -u -j ${jail_name}

    echo "-> list jail"
    poudriere jail -l

    echo "done"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
        main "$@"
fi
