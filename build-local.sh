#!/bin/bash

BASEDIR=$(dirname "$0")
VERSION=latest #"latest" for local builds
IMAGENAME="theden/linux-games"

docker build -t ${IMAGENAME}:"${VERSION}" -f "${BASEDIR}"/Dockerfile "${BASEDIR}"
