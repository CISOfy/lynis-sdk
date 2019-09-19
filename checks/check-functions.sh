#!/bin/sh

RETVAL=0
TOTAL=3

Assert() {

    printf "[1/${TOTAL}] Skip reason is always defined "

    echo "- Output -"
    grep "Register " ${LYNIS_PATH}/include/tests_* | grep "\-\-preqs-met" | grep -v "\-\-skip\-reason" | awk '{ print "Test "$4" in "$1 }'

    printf "[2/${TOTAL}] Spacing for 'else' should be multitude of 4 - Any results should be checked"
    # Ignore items that are on the same line (awk/then)
    grep -R "else" ${LYNIS_PATH}/include/tests_* | grep -v -E "awk|AWKBINARY" | grep -v "then" | grep -v "^#" | grep -E -v "#([[:space:]]+)else" | awk -F '//' '{ n = gsub(/ /, "", $1); print $1" "n }' | awk '{ if ($2 %4 > 0) { print $1" "$2}}'

    printf "[3/${TOTAL}] Any counter should be named COUNTER (instead of N)"
    grep -R " N=0" ${LYNIS_PATH}

    return ${RETVAL}
}
