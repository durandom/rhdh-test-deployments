#!/bin/bash
set -e

# Load secrets
source secret.env

# Get the Keycloak route
KEYCLOAK_ROUTE=$(oc get route keycloak -o template --template='{{.spec.host}}')

# Get the admin password
KEYCLOAK_ADMIN_PASSWORD=$(oc get secret credential-rhdh-keycloak -o template --template='{{.data.ADMIN_PASSWORD}}' | base64 -d)

# Print out login details
echo "==========================="
echo "Keycloak Admin Login Info:"
echo "==========================="
echo "URL: https://$KEYCLOAK_ROUTE"
echo "Username: admin"
echo "Password: $KEYCLOAK_ADMIN_PASSWORD"
echo "==========================="
echo "To log in, open your browser and navigate to the URL above."