#!/bin/bash

echo "Adding users to SonarQube"

SONARQUBE_URL="http://localhost:9000"

if [ -z "$SONARQUBE_ADMIN_USER" ] || [ -z "$SONARQUBE_ADMIN_PASSWORD" ] || [ -z "$SONARQUBE_USER" ] || [ -z "$SONARQUBE_PASSWORD" ]; then
    echo "One or more required environment variables are not defined:"
    [ -z "$SONARQUBE_ADMIN_USER" ] && echo "SONARQUBE_ADMIN_USER is not defined"
    [ -z "$SONARQUBE_ADMIN_PASSWORD" ] && echo "SONARQUBE_ADMIN_PASSWORD is not defined"
    [ -z "$SONARQUBE_USER" ] && echo "SONARQUBE_USER is not defined"
    [ -z "$SONARQUBE_PASSWORD" ] && echo "SONARQUBE_PASSWORD is not defined"
else
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -u "$SONARQUBE_ADMIN_USER:$SONARQUBE_ADMIN_PASSWORD" -X POST \
        "$SONARQUBE_URL/api/users/create" \
    -d "login=$SONARQUBE_USER&name=$SONARQUBE_USER&password=$SONARQUBE_PASSWORD")
    
    if [[ "$RESPONSE" -eq 200 ]]; then
        echo "User $SONARQUBE_USER created successfully"
    else
        echo "Error creating user $SONARQUBE_USER. Code: $RESPONSE"
    fi
fi
