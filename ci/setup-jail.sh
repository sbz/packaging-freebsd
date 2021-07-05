#!/usr/bin/env bash

set -o nounset
set -o pipefail

: ${PORTSDIR:="/usr/ports"}
: ${VERSION:="12.2-RELEASE"}
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

    poudriere jail -c -j "${VERSION:0:2}${ARCH}" \
                      -v "${VERSION}" \
                      -p portsdir \
                      -a "${ARCH}" \
                      -m ftp
    poudriere jail -l

    echo "done"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
        main "$@"
fi
