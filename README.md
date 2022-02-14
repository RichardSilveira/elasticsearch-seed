# elasticsearch-seed
Creates the elasticsearch index and inserts multiple documents at once by using the bulk API, plus leveraging the wait- for-it pattern to run the commands only after the elasticsearch cluster is green - useful for local development and E2E CI testing scenarios.

## Docker image

The docker image can be found at https://hub.docker.com/repository/docker/richardsilveira/elasticsearch-seed/

You can use it as follows:
```yaml
  elasticsearch-seed:
    container_name: elasticsearch-seed
    image: richardsilveira/elasticsearch-seed
    environment:
      - ELASTICSEARCH_URL=http://elasticsearch:9200
      - INDEX_NAME=my-index
    volumes:
      - ./my-custom-index-settings.json:/seed/index-settings.json
      - ./my-custom-index-bulk-payload.json:/seed/index-bulk-payload.json
```
> More details at the [example](./example) directory.

This image is compatible with the Amazon OpenSearch Service _- [OpenDistro distribution](https://opendistro.github.io/for-elasticsearch-docs/)_, so, 
if you're using the `amazon/opendistro-for-elasticsearch` image you'll need to inform
a `USER` and a `PASSWORD` in the `environment` section to authenticate, this image has the value `admin` for both as default values.
> If you are using the elasticsearch official image without the xpack security features, the user and password values will be ignored _- it works even passing them with the default values_ 