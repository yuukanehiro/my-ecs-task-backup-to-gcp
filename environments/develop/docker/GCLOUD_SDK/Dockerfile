FROM google/cloud-sdk:alpine
# FROM google/cloud-sdk:276.0.0-alpine

#ARG ENVIRONMENT="local" // buildspec-ciで指定する
ARG ENVIRONMENT="develop" // buildspec-ciで指定する

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash python3 python3-dev py3-pip jq
RUN yes|pip3 install awscli

COPY ./environments/${ENVIRONMENT}/docker/GCLOUD_SDK/service_account.json /usr/src/app/service_account.json
COPY ./environments/${ENVIRONMENT}/docker/GCLOUD_SDK/sync_from_s3_to_gcs.sh /usr/src/app/sync_from_s3_to_gcs.sh
RUN chmod +x /usr/src/app/sync_from_s3_to_gcs.sh

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD ["sh", "/usr/src/app/sync_from_s3_to_gcs.sh"]
RUN echo "task completed!"
