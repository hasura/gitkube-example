# gitkube-example

An nginx example application to be used with [gitkube](https://github.com/hasura/gitkube): git push to deploy on to Kubernetes.

## Instructions

- Install [gitkube](https://github.com/hasura/gitkube) on your Kubernetes cluster
- Clone this repo:
  ```bash
  $ git clone https://github.com/hasura/gitkube-example
  $ cd gitkube-example
  ```
- Create a kubernetes deployment and service:
  ```bash
  $ kubectl create -f k8s.yaml
  ```
- Add your SSH public key to `remote.yaml`:
  ```bash
  $ cat ~/.ssh/id_rsa.pub | awk '$0="  - "$0' >> "remote.yaml"
  ```
- Create the gitkube remote:
  ```bash
  $ kubectl create -f remote.yaml
  ```
- Wait for the remote url:
  ```bash
  $ kubectl get remote example -o json | jq -r '.status.remoteUrl'
  # remoteUrl will be like ssh://example-default@[ip-address]/~/git/example-default
  ```
- Create the git remote:
  ```bash
  $ git remote add example [remoteUrl]
  ```
- Git push to update the nginx application
  ```bash
  $ git push example master
  ```
- Checkout the application using kubectl proxy:
  ```bash
  $ kubectl proxy
  ```
  Visit http://localhost:8001/api/v1/namespaces/default/services/nginx/proxy on browser

