#!/bin/sh

# (!) development purposes
#SONAR_HOST_URL="http://46.101.210.20:9000"
#SONAR_LOGIN="q"
#SONAR_PASSWORD=""

isUndefined() {
    if [ -z "$1" ]; then
        # 0 = true
        return 0
    else
        # 1 = false
        return 1
    fi
}

isPresent()
{
    if [ ! -z "$1" ]; then
        # 0 = true
        return 0
    else
        # 1 = false
        return 1
    fi
}

# concat sonar-scanner execute extended command
SONAR_SCANNER_CMD="sonar-scanner -x"

# Required variables: $SONAR_HOST_URL
if isUndefined ${SONAR_HOST_URL}; then
    echo "Configuration: undefined GitLab variable: \"SONAR_HOST_URL\""
    exit 1
else
    SONAR_SCANNER_CMD="$SONAR_SCANNER_CMD -Dsonar.host.url=${SONAR_HOST_URL}"
fi

# Optional variables (credentials): $SONAR_LOGIN, $SONAR_PASSWORD
if isPresent ${SONAR_LOGIN}; then
    SONAR_SCANNER_CMD="$SONAR_SCANNER_CMD -Dsonar.login=${SONAR_LOGIN}"
else
    echo "Configuration: sonar-scanner skip variable: -Dsonar.login"
fi

if isPresent ${SONAR_PASSWORD}; then
    SONAR_SCANNER_CMD="$SONAR_SCANNER_CMD -Dsonar.password=${SONAR_PASSWORD}"
else
    echo "Configuration: sonar-scanner skip variable: -Dsonar.password"
fi

echo "Configuration: sonar-scanner execute extended command"
echo ${SONAR_SCANNER_CMD}
echo "Execute sonar-scanner analysis"

${SONAR_SCANNER_CMD}
