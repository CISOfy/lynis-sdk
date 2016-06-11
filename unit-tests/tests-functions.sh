#!/bin/sh

RETVAL=0
TOTAL=2

Assert() {

    printf "[1/${TOTAL}] DirectoryExists (valid directory) "
    if DirectoryExists .; then printf "OK\n"; else printf "FAILED\n"; RETVAL=1; fi
    printf "[2/${TOTAL}] DirectoryExists (invalid directory) "
    if ! DirectoryExists non-existing-dir; then printf "OK\n"; else printf "FAILED\n"; RETVAL=1; fi

    return ${RETVAL}
}