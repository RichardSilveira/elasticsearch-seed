# elasticsearch-seed
Creates the elasticsearch index and inserts multiple documents at once by using the bulk API, plus leveraging the wait- for-it pattern to run the commands only after the elasticsearch cluster is green - useful for local development and E2E CI testing scenarios.
