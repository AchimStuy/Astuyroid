#!/bin/bash

podman pull lineageos4microg/docker-lineage-cicd

podman run \
    -e "BRANCH_NAME=lineage-22.2" \
    -e "BUILD_TYPE=user" \
    -e "DEVICE_LIST=sargo" \
    -e "MAKE_IMG_ZIP_FILE=true" \
    -e "WITH_AVB=true" \
    -v "./cache:/srv/ccache" \
    -v "./keys:/srv/keys" \
    -v "./local_manifests:/srv/local_manifests" \
    -v "./logs:/srv/logs" \
    -v "./src:/srv/src" \
    -v "./userscripts:/srv/userscripts" \
    -v "./zips:/srv/zips" \
    lineageos4microg/docker-lineage-cicd
    #-e "CLEAN_AFTER_BUILD=false" \
