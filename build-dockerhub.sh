#!/bin/bash

BASEDIR=$(dirname "$0")
VERSION=$(cat $BASEDIR/VERSION)
IMAGENAME="theden/linux-games"

docker build -t ${IMAGENAME}:"${VERSION}" -f "${BASEDIR}"/Dockerfile "${BASEDIR}"
