export K8S_INGRESS_IP="51.179.232.203"
export TLD="wire48.net"
export POSTGRES_DB="mattermost"
export POSTGRES_USER="mmuser"
export MM_SQLSETTINGS_DATASOURCE="postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}?sslmode=disable&connect_timeout=10"

export POSTGRES_PASSWORD_B64="$(echo -n ${POSTGRES_PASSWORD} | base64 -w 0)"
export POSTGRES_USER_B64="$(echo -n ${POSTGRES_USER} | base64 -w 0)"
export POSTGRES_DB_B64="$(echo -n ${POSTGRES_DB} | base64 -w 0)"
export MM_SQLSETTINGS_DATASOURCE_B64="$(echo -n ${MM_SQLSETTINGS_DATASOURCE} | base64 -w 0)"

if [ "${SEMAPHORE_GIT_BRANCH}" == "main" ]; then
	DEPLOYMENT_URL="${SEMAPHORE_GIT_REPO_NAME}"
else
	DEPLOYMENT_URL="${SEMAPHORE_GIT_BRANCH}.preprod.${SEMAPHORE_GIT_REPO_NAME}"
fi

