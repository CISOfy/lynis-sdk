#!/bin/sh

RETVAL=0
TOTAL=2

Assert() {

    printf "[1/${TOTAL}] Skip reason is always defined "

    echo "- Output -"
    grep "Register " ${LYNIS_PATH}/include/tests_* | grep "\-\-preqs-met" | grep -v "\-\-skip\-reason" | awk '{ print "Test "$4" in "$1 }'

    #if DirectoryExists .; then printf "OK\n"; else printf "FAILED\n"; RETVAL=1; fi
    #printf "[2/${TOTAL}] DirectoryExists (invalid directory) "
    #if ! DirectoryExists non-existing-dir; then printf "OK\n"; else printf "FAILED\n"; RETVAL=1; fi

    return ${RETVAL}
}