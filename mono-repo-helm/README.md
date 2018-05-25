# Mono-repo-helm

Install `gitkube` cli as per [this](../README.md)

1. Download this repo and unzip it to a path

```
$ wget https://github.com/hasura/gitkube-example/archive/master.zip
$ unzip master.zip
$ mv gitkube-example-master gitkube-examples
```
2. Goto `mono-repo-helm` directory and initialise a repo

```
$ cd gitkube-examples/mono-repo-helm
$ git init
```

3. Generate a Remote spec

```
$ gitkube remote generate -f myremote.yaml

> Remote name: myremote
> Namespace: default
> Public key file: /home/tselvan/.ssh/id_rsa.pub
> Initialisation:
    > K8s Yaml Manifests
    > Helm Chart
    --------------------
    > None
> Manifests/Chart directory: mychart
> Choose docker registry:
    > docker.io/tirumarai
    ---------------------
    > Specify a different registry
    > Skip for now
> Deployment name: www
> Container name: www
> Dockerfile path: microservices/nginx/Dockerfile
> Build context path: microservice/nginx
> Add another container? N
> Add another deployment? N
```
4. Edit the Remote spec to add helm release name

```
$ # Open myremote.yaml in any text editor
$ vim myremote.yaml

$ # Edit the manifests section to the following
...
manifests:
  helm:
    release: myapp
    path: mychart
...
```

5. Create the Remote

```
$ gitkube remote create -f myremote.yaml
```

6. Git push

```
$ git commit -am "mono repo helm"
$ git push myremote master

```
