#!/usr/bin/env bash
# exit on error
#set -o errexit

SRV=$(echo $RENDER_INSTANCE_ID | cut -d '-' -f 1,2)
#echo "${SRV}"

if [[ "$IS_PULL_REQUEST" == "true" ]]; then
    echo "IS PR"

    JSON='{"name":"%s"}\n'
    DOMAIN_JSON=$(printf "$JSON" "$RENDER_SERVICE_NAME.heyhey.co.uk")
    echo $DOMAIN_JSON

    curl --request POST \
        --url https://api.render.com/v1/services/$SRV/custom-domains \
        --header "Accept: application/json" \
        --header "Authorization: Bearer $RENKEY" \
        --header "Content-Type: application/json" \
        --data "$DOMAIN_JSON"

    echo "Now create $RENDER_SERVICE_NAME.heyhey.co.uk CNAME record pointing at $RENDER_SERVICE_NAME.onrender.com..."
fi
