#!/bin/bash

# usage: gandi-dns-update.sh domain.com www 127.0.0.01 

DOMAINNAME="${1}"
DOMAINRECORD="${2}"
DOMAINVALUE="${3}"

curl -X PUT \
	-H "Authorization: Apikey ${GANDI_API_KEY}"  \
	-H "Content-Type: application/json" \
	--data @- \
	https://api.gandi.net/v5/livedns/domains/${DOMAINNAME}/records/${DOMAINRECORD}  <<EOF
{
  "items": [
    {
      "rrset_type": "A",
      "rrset_values": [
        "${DOMAINVALUE}"
      ],
      "rrset_ttl": 900
    }
  ]
}
EOF
