#!/bin/bash

echo -e "[Credentials]\naws_access_key_id = ${AWS_ACCESS_KEY_ID}\naws_secret_access_key = ${AWS_ACCESS_KEY_SECRET}\n\n[s3]\nuse-signv4=True\nhost=s3.ap-northeast-1.amazonaws.com" > /tmp/.boto

echo "export BOTO_CONFIG start"
export BOTO_CONFIG=/tmp/.boto
echo "export BOTO_CONFIG end"

echo "gcloud auth start"
gcloud auth activate-service-account --key-file /usr/src/app/service_account.json
echo "gcloud auth end"

echo "gsutil rsync start"
gsutil -m cp -r s3://sample-backup-production/ gs://sample-backup-production/
echo "gsutil rsync end"
