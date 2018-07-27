#!/bin/bash

VERSION=latest # use latest for local builds
BASEDIR=$(dirname "$0")
IMAGENAME="linux-games"

docker build -t ${IMAGENAME}:"${VERSION}" -f "${BASEDIR}"/Dockerfile "${BASEDIR}"

