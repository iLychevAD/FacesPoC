#!/bin/bash

FILE='faces/107.jpg'

GET_SIGNEDURL_ENDPOINT=https://i2hoa7whqh.execute-api.us-east-1.amazonaws.com/v1/signed-url

echo "Prepare url parameters and headers"
declare -A METADATA=( 
  ["firstname"]="John"
  ["surname"]="Doe"
  ["email"]="no@email.com"
  ["id"]="1234567"
  ["gender"]="n/a"
)

PARAMS=''
for KEY in "${!METADATA[@]}"
do 
  PARAMS="${PARAMS}${KEY}=${METADATA[$KEY]}&"
done

declare -a CURL_HEADERS
for KEY in "${!METADATA[@]}"
do 
  CURL_HEADERS+=( '-H' "x-amz-meta-${KEY}: ${METADATA[$KEY]}" )
done

echo "Obtain a signed URL"
SIGNED_URL=$( 
  curl -X GET \
  "${GET_SIGNEDURL_ENDPOINT}?${PARAMS}"
)

#echo ${CURL_HEADERS}
#echo ${SIGNED_URL}

echo "Upload file"
curl -X PUT \
  -T ${FILE} \
  "${HEADERS[@]}" \
  "${SIGNED_URL}"
