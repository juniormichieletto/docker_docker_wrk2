# docker_wrk2 (juniormichieletto/docker_wrk2)

Docker definition to small docker image with wrk HTTP benchmarking tool.

Image uncompressed with less than 9mb.

## Sample usage

```bash
    docker run --rm juniormichieletto/docker_wrk2 -t10 -c100 -d10s -R300 https://www.google.com/
```

Note that we dont neeed type "wrk" since this is in dockerImage entrypoint.

### Simple command explanation

 ```bash
    docker run <docker_run_options> juniormichieletto/docker_wrk2 <wrk_options>
 ```

- "docker run" : command to run some container
- "--rm" : run option to remove the container after finish benchmark
- "juniormichieletto/docker_wrk2": container image name
- "-t10 -c100 -d10s -R300 https://www.google.com/": wrk2 options, 10 threads, requests in 100 concurrent using a simple "get" to URL "https://www.google.com/" with thoughput 300.

> To see more options take a look at [wrk2 HTTP benchmarking tool](https://github.com/giltene/wrk2)

## Important tip

If your are using to test against other local docker container running locally, make sure that both are in the same network.

For docker for windows you can use the docker host(host.docker.internal) instead 127.0.0.1 like:

 ```bash
    docker run --rm juniormichieletto/docker_wrk2 -t10 -c100 -d10s -R300 http://host.docker.internal/api/test
 ```

- Contributions? yes please send the PR :)
