#!/bin/sh


# apt-get install cabal-install
# cabal-update
# cabal-install

SHELLCHECK="/home/$(whoami)/.cabal/bin/shellcheck"
EXCLUDE="--exclude=SC2006,SC2012,SC2016,SC2028,SC2034,SC2039,SC2063,SC2086,SC2166"

if [ $# -eq 0 ]; then
    FILES="../lynis/include/*"
  else
    FILES="$1"
fi

# Run shellcheck when it is available
if [ -x ${SHELLCHECK} ]; then
    ${SHELLCHECK} --shell=sh --external-sources ${EXCLUDE} ${FILES}
  else
    echo "Could not find shellcheck"
    exit 1
fi

#EOF
