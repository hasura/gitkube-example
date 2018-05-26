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
$ git add . && git commit -am 'init'
```

2. Generate the Remote spec (remote.yaml) to ony deploy the  kubernetes manifests and NOT build any deployments

```
$ gitkube remote generate -f myremote.yaml
> Remote name: myremote
> Namespace: default
> Public key file: /home/tselvan/.ssh/id_rsa.pub
> Initialisation:
    > K8s Yaml Manifests
    ------
    > Helm Chart
    > None
> Manifests/Chart directory: ./
> Deployment name: www
> Container name: www
> Dockerfile path: Dockerfile
> Build context path: .
> Add another container? N
> Add another deployment? N
```

3. Edit the remote.yaml and set the deployments key to be empty. 

```
apiVersion: gitkube.sh/v1alpha1
kind: Remote
...
spec:
  authorizedKeys:
  - | ...
  deployments: []
# REMOVE THESE LINES and set deployments to just an empty list "[]" as above
#  - containers:
#    - dockerfile: Dockerfile
#      name: www
#      path: .
#    name: www
...
```

3. Create the remote

```
$ gitkube remote create -f myremote.yaml
```

4. Git commit and deploy to deploy the kubernetes manifests

```
$ git remote add myremote <> #Get the remote URL from the output of the previous command
$ git push myremote master
```


## Microservices repo

1. Goto `multi-repo` directory and initialise the microservice repo that contains the source code and the Dockerfile

```
$ cd gitkube-examples/multi-repo/nginx
$ git init
$ git add . && git commit -am 'init'
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

The command above will yield the remote name that you shoud add using

```
$ git remote add myremote <>
```

4. Git push

```
$ git commit -am "multi repo"
$ git push myremote master
```

