FROM curlimages/curl:latest
WORKDIR seed

ARG ELASTICSEARCH_URL
ENV ELASTICSEARCH_URL=$ELASTICSEARCH_URL
ARG INDEX_NAME
ENV INDEX_NAME=$INDEX_NAME
ARG USER=admin
ENV USER=$USER
ARG PASSWORD=admin
ENV PASSWORD=$PASSWORD

COPY elasticsearch-seed-script.sh .
COPY index-settings.json .
COPY index-bulk-payload.json .

ENTRYPOINT ["sh", "elasticsearch-seed-script.sh"]
