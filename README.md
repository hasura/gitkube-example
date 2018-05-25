# gitkube-examples

An nginx example application to be used with [gitkube](https://github.com/hasura/gitkube): git push to deploy on to Kubernetes.

## Installation instructions

### Using kubectl

```sh
kubectl create -f https://storage.googleapis.com/gitkube/gitkube-setup-stable.yaml

#expose gitkubed service
kubectl --namespace kube-system expose deployment gitkubed --type=LoadBalancer --name=gitkubed
```

### Using gitkube CLI 

1. Install Gitkube CLI:
   - Linux/MacOS
   ``` bash
   curl https://raw.githubusercontent.com/hasura/gitkube/master/gimme.sh | bash
   ```
   - Windows: download the latest [release](https://github.com/hasura/gitkube/releases) and add it to your `PATH`.

2. Use Gitkube CLI to install Gitkube on the cluster:
   ```bash
   gitkube install
   ```
   
## Repository configuration

Gitkube works with whatever kind of repository configurations you prefer. Here are some common configurations:

#### Mono-repo

Your git repo contains configuration + code for your entire application including all your microservices and k8s manifests.

Follow the instructions for mono-repo setups below:

- [Mono-repo with K8s yamls and microservices](mono-repo/README.md)
- [Mono-repo with Helm chart and microservices](mono-repo-helm/README.md)

#### Multi-repo

You have separate repos for your configuration and microservices.

Follow the instructions for multi-repo setup below:

- [Multi-repo with K8s yamls in one repo and microservices in another repo](multi-repo/README.md)

