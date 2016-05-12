#!/bin/sh

RETVAL=0

Assert() {

    printf "[1/1] DirectoryExists (valid directory) "
    if DirectoryExists .; then printf "OK\n"; else printf "FAILED\n"; RETVAL=1; fi
    printf "[1/2] DirectoryExists (invalid directory) "
    if ! DirectoryExists non-existing-dir; then printf "OK\n"; else printf "FAILED\n"; RETVAL=1; fi

    return ${RETVAL}
}