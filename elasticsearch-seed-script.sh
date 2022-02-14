#!/bin/sh

echo ELASTICSEARCH_URL: "$ELASTICSEARCH_URL"
echo INDEX_NAME: "$INDEX_NAME"
echo USER: "$USER"
echo PASSWORD: "$PASSWORD"

until $(curl -XGET --insecure --user $USER:$PASSWORD "$ELASTICSEARCH_URL/_cluster/health?wait_for_status=green" > /dev/null); do
    printf 'WAITING FOR THE ELASTICSEARCH ENDPOINT BE AVAILABLE, trying again in 5 seconds \n'
    sleep 5
done

# Create the index
curl -XPUT --insecure --user $USER:$PASSWORD "$ELASTICSEARCH_URL/$INDEX_NAME" -H 'Content-Type: application/json' -d @index-settings.json

# The bulk operation to insert multiple documents into the index
curl -XPOST --insecure --user $USER:$PASSWORD "$ELASTICSEARCH_URL/$INDEX_NAME/_bulk" -H 'Content-Type: application/x-ndjson' --data-binary @index-bulk-payload.json
