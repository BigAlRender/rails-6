#!/usr/bin/env bash
# exit on error
#set -o errexit

SRV=$(echo $RENDER_INSTANCE_ID | cut -d '-' -f 1,2)
#echo "${SRV}"

if [[ "$IS_PULL_REQUEST" == "true" ]]; then
    echo "IS PR"
    echo "This was a PR blueprint deploy! 🎉"
else
    echo "This was a non PR main blueprint deploy! 🎉"
fi
