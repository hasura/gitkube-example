# Multi-repo

Install `gitkube` cli as per [this](../README.md)

1. Download this repo and unzip it to a path

```
$ wget https://github.com/hasura/gitkube-example/archive/master.zip
$ unzip master.zip
$ mv gitkube-example-master gitkube-examples
```

## Configuration repo

1. Goto `multi-repo` directory and initialise the configuration repo

```
$ cd gitkube-examples/multi-repo/config
$ git init
```

## Microservices repo

1. Goto `multi-repo` directory and initialise the configuration repo

```
$ cd gitkube-examples/multi-repo/nginx
$ git init
```


2. Generate a Remote spec

```
$ gitkube remote generate -f myremote.yaml

> Remote name: myremote
> Namespace: default
> Public key file: /home/tselvan/.ssh/id_rsa.pub
> Initialisation:
    > K8s Yaml Manifests
    > Helm Chart
    > None
    ------
> Choose docker registry:
    > docker.io/tirumarai
    ---------------------
    > Specify a different registry
    > Skip for now
> Deployment name: www
> Container name: www
> Dockerfile path: Dockerfile
> Build context path: .
> Add another container? N
> Add another deployment? N
```

3. Create the Remote

```
$ gitkube remote create -f myremote.yaml
```

4. Git push

```
$ git commit -am "multi repo"
$ git push myremote master
```

