# CICD Demo

Trying to build a CICD pipeline using semaphore to deploy mattermost in to k8s.

## Variables

```GANDI_API_KEY```

API key for creating and updating gandi DNS records

```POSTGRES_PASSWORD```

required:
The Postgres user password. Used for creating the database and for building the MM_SQLSETTINGS_DATASOURCE string unless specified

```POSTGRES_USER```

required:
The user that will be created for mattermost usage and for building the MM_SQLSETTINGS_DATASOURCE string unless specified

```POSTGRES_DB```

The name of the database mattermost will use

```MM_SQLSETTINGS_DATASOURCE```

The database connection string for mattermost to use. Will default to:

```postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB}?sslmode=disable&connect_timeout=10```
