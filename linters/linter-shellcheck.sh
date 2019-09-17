#!/bin/sh

# apt-get install cabal-install
# cabal-update
# cabal-install

if ! which shellcheck 2> /dev/null; then
    echo "Could not find shellcheck - install it first and add it to your path"
    echo ""
    echo "AMD64 precompiled (latest): wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz" | tar -xJv"
    echo "Cabal (Debian/Ubuntu): apt install cabal-install && cabal-update && cabal-install shellcheck)"
    exit 1
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

# Future research: increase memory size
# +RTS -K100000000 -RTS

# SC1090: Can't follow non-constant source. Use a directive to specify location.
# We already use a monolithic file

EXCLUDE="--exclude=SC1090,SC2006,SC2012,SC2016,SC2028,SC2034,SC2039,SC2063,SC2086,SC2166"

if [ $# -eq 0 ]; then

    # Let's craft a single monolithic file that mimics a modular Lynis
    # Notes:
    # - Do things as much as possible in the same order due to variable assignments
    # - Our concatened file is not usuable as a tool (as it still has the includes)

    FILE="${HOME}/shellcheck_lynis_file.tmp"
    cat ../lynis/lynis \
        ../lynis/include/consts \
        ../lynis/include/functions \
        ../lynis/db/languages/en \
        ../lynis/include/parameters \
        ../lynis/include/osdetection \
        ../lynis/include/binaries \
        ../lynis/include/tests_* \
        ../lynis/include/report \
        ../lynis/include/tool_tips \
        ../lynis/include/data_upload \
        > ${FILE}

    sed -i -e 's#\. ${DBDIR}#\. \.\./lynis/db#g' ${FILE}

else
    FILE="$1"
fi


# Run the shellcheck analysis
# Memory settings (not used now): +RTS -K100000000 -RTS
shellcheck --shell=sh ${EXCLUDE} ${FILE}

# Clean up
if [ -f "${FILE}" ]; then rm ${FILE}; fi

#EOF
