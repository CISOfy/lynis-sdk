#!/bin/sh

RETVAL=0
TOTAL=3

Assert() {

    LANGUAGES_DIR="../lynis/db/languages"
    LANGUAGES_STRINGS_MISSING=0

    printf "[1/${TOTAL}] Language Directory Exists (valid languages directory)"
    if DirectoryExists ${LANGUAGES_DIR}; then SDKPrintOK; else SDKPrintFailed; RETVAL=1; fi
    printf "[2/${TOTAL}] en-US Translation File Exists"
    if FileExists ${LANGUAGES_DIR}/en-US; then SDKPrintOK; else SDKPrintFailed; RETVAL=1; fi

    printf "[3/${TOTAL}] Checking Coverage of Strings"
    STRINGS=$(awk -F= '{ print $1 }' ${LANGUAGES_DIR}/en-US)

    FIND=$(ls ${LANGUAGES_DIR})
    for FILE in ${FIND}; do
        if [ -f ${LANGUAGES_DIR}/${FILE} -a ! -L ${LANGUAGES_DIR}/${FILE} ]; then
            for CHECK in ${STRINGS}; do
                STRING_EXISTS=$(egrep "^(#)?${CHECK}=" ${LANGUAGES_DIR}/${FILE})
                if [ -z "${STRING_EXISTS}" ]; then printf "\n        NOTICE: string '${CHECK}' missing in language '${FILE}'"; LANGUAGES_STRINGS_MISSING=1; fi
            done
        fi
    done

    if [ ${LANGUAGES_STRINGS_MISSING} -eq 0 ]; then SDKPrintOK; else printf "\nNotice: Translation needed for one or more strings\n"; fi


    return ${RETVAL}
}