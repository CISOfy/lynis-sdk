#!/bin/sh


# apt-get install cabal-install
# cabal-update
# cabal-install

SHELLCHECK="${HOME}/.cabal/bin/shellcheck"
EXCLUDE="--exclude=SC2006,SC2012,SC2016,SC2028,SC2034,SC2039,SC2063,SC2086,SC2166"

if [ $# -eq 0 ]; then

    # Let's craft a single monolithic file that mimics a modular Lynis
    # Notes:
    # - Do things as much as possible in the same order due to variable assignments
    # - Our concatened file is not usuable as a tool (as it still has the includes)

    cat ../lynis/lynis \
        ../lynis/include/consts \
        ../lynis/include/functions \
        ../lynis/db/languages/en \
        ../lynis/include/parameters \
        ../lynis/include/osdetection \
        ../lynis/include/binaries \
        ../lynis/include/report \
        ../lynis/include/tool_tips \
        ../lynis/include/data_upload \
        > ${HOME}/shellcheck_lynis_file.tmp

    FILES="${HOME}/shellcheck_lynis_file.tmp"
    #FILES="../lynis/include/*"
else
    FILES="$1"
fi

# Lynis work flow

# lynis
# ./include/consts
# ./include/functions
# ./db/languages/en
# ./include/parameters
# ./include/osdetection
# optional language files
# ./include/binaries
# plugins phase 1
# tests
# optional: tests_custom
# helper tool
# plugins phase 2
# include/report
# include/tool_tips
# include/data_upload

# Run shellcheck when it is available
if [ -x ${SHELLCHECK} ]; then
    ${SHELLCHECK} --shell=sh --external-sources ${EXCLUDE} ${FILES}
else
    echo "Could not find shellcheck - install it first (apt install cabal-install && cabal-update && cabal-install shellcheck)"
    exit 1
fi

#EOF
