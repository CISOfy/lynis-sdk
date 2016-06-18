#!/bin/sh

RETVAL=0

UpdateLanguageFiles() {

    LANGUAGES_DIR="../lynis/db/languages"
    LANGUAGES_STRINGS_MISSING=0

    printf "Checking language directories and files"
    if ! DirectoryExists ${LANGUAGES_DIR}; then SDKPrintFailed; exit 1; fi
    if ! FileExists ${LANGUAGES_DIR}/en-US; then SDKPrintFailed; exit 1; fi

    printf "Checking coverage of text strings\n"

    printf "When changes are found, merge them with language files? (y/N)"
    read CHANGE_FILES
    if [ "${CHANGE_FILES}" = "y" -o "${CHANGE_FILES}" = "Y" ]; then CHANGE_FILES=1; else CHANGE_FILES=0; fi

    STRINGS=$(awk -F= '{ print $1 }' ${LANGUAGES_DIR}/en-US)

    FIND=$(ls ${LANGUAGES_DIR})
    for FILE in ${FIND}; do
        if [ -f ${LANGUAGES_DIR}/${FILE} -a ! -L ${LANGUAGES_DIR}/${FILE} ]; then
            for CHECK in ${STRINGS}; do
                STRING_EXISTS=$(egrep "^(#)?${CHECK}=" ${LANGUAGES_DIR}/${FILE})
                if [ -z "${STRING_EXISTS}" ]; then
                    printf "        String '${CHECK}' missing in language '${FILE}'\n"
                    RELATED_TEXT=$(egrep "^${CHECK}=" ${LANGUAGES_DIR}/en-US | awk -F= '{ print $2 }')
                    if [ ${CHANGE_FILES} -eq 1 ]; then
                        printf "        Adding string of '${CHECK}' with English template text (${RELATED_TEXT})\n"
                        echo "#${CHECK}=${RELATED_TEXT}" >> ${LANGUAGES_DIR}/${FILE}
                    fi
                fi
            done
        fi
    done

    return ${RETVAL}
}