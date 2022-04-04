## Tests in Docker

To avoid the need of a local redis service or a ruby environment, the file `Dockerfile.tests` may be used.

To build a local docker image from the specific development branch, type the following command.

```bash
docker build -f Dockerfile.tests -t redis-cluster-proxy-tests .

```

Then, the tests may be run with the following command.

```bash
docker run redis-cluster-proxy-tests make test 
```