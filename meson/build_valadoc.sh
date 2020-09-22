#!/bin/sh

INFILES=${MESON_SOURCE_ROOT}/*.vala
OUTDIR=${MESON_BUILD_ROOT}/valadoc
NAME=""
VERSION=""

usage() {
    echo "Usage: $0 [ -i INPUT_FILES ] [ -o OUTPUT_DIR ] [ -n NAME ] [-v VERSION ]" 1>&2
}

exit_abnormal() {
    usage
    exit 1
}

while getopts ":i:o:n:v:" options; do
    case "${options}" in
        i)
            INFILES=${OPTARG}
            ;;
        o)
            OUTDIR=${OPTARG}
            ;;
        n)
            NAME=${OPTARG}
            ;;
        v)
            VERSION=${OPTARG}
            ;;
        :)
            echo "Error: -${OPTARG} requires an argument."
            exit_abnormal
            ;;
        *)
            exit_abnormal
            ;;
    esac
done

if [ -d $OUTDIR ]; then
    rm -r $OUTDIR
fi

valadoc $INFILES --package-name=$NAME --package-version=$VERSION -o $OUTDIR
