#!/bin/bash
set -x
source secret.env

RES=$(curl -s -X POST -k \
    -u "${AUTH_OIDC_CLIENT_ID}:${AUTH_OIDC_CLIENT_SECRET}" \
    "${KEYCLOAK_URL}/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token" \
    -d "client_id=${AUTH_OIDC_CLIENT_ID}&grant_type=client_credentials")
export TOKEN=$(echo $RES | jq -r .access_token)
echo $TOKEN


curl -k -v -s -H "Authorization: Bearer $TOKEN" \
  -k "${KEYCLOAK_URL}/admin/realms/${KEYCLOAK_REALM}/groups/count"
