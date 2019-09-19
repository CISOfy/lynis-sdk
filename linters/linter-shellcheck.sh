#!/bin/sh

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

if ! which shellcheck 2> /dev/null; then
    echo "Could not find shellcheck - install it first and add it to your path"
    echo ""
    echo "AMD64 precompiled (latest): wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz" | tar -xJv"
    echo "Cabal (Debian/Ubuntu): apt install cabal-install && cabal-update && cabal-install shellcheck)"
    exit 1
fi

#
# Work in Progress (WIP)
#
# Let's craft a single monolithic file that mimics a modular Lynis
# Notes:
# - Do things as much as possible in the same order due to variable assignments
# - Our concatened file is not usuable as a tool (as it still has the includes)

#monolithic_file=$(mktemp /tmp/lynis-monolithic-XXXXXXXXXX)
#
#    cat ../lynis/lynis \
#        ../lynis/include/consts \
#        ../lynis/include/functions \
#        ../lynis/db/languages/en \
#        ../lynis/include/parameters \
#        ../lynis/include/osdetection \
#        ../lynis/include/binaries \
#        ../lynis/include/tests_* \
#        ../lynis/include/report \
#        ../lynis/include/tool_tips \
#        ../lynis/include/data_upload \
#        > ${monolithic_file}
#
#sed -i -e 's#\. ${DBDIR}#\. \.\./lynis/db#g' ${monolithic_file}
#sed -i -e 's#\. ${INCLUDEDIR}#\. \.\./lynis/db#g' ${monolithic_file}



# Run the shellcheck analysis

excluded_tests="SC1090,SC2006,SC2012,SC2016,SC2028,SC2034,SC2039,SC2063,SC2086,SC2166,SC2181"

# SC1090: Can't follow non-constant source. Use a directive to specify location.
# We already use a monolithic file

# SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
# Usually we don't care about output of commands. Disabled for now, revisit in future


# --check-sourced also shows warnings in included files
# --source-path defines where included files can be found
# --external-sources allows files that are not part of the path


shellcheck --check-sourced --source-path=../lynis/db:../lynis/include --shell=sh --exclude=${excluded_tests} ../lynis/lynis ../lynis/include/*


#EOF
