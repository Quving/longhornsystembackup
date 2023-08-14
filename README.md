# Kube Yaml Invoker

## What's here?
As can be easily guessed, the container does just that. It calls a Kubernetes manifest using kubectl.

## Usage

### Environment Variables

In this example $MANIFEST_DATA and $KUBECONFIG_DATA is the base64 encoded string based on the Manifest and kubeconfig.

Example:
```bash
cat $FILE | base64
```

Run the container:
```bash
docker run --rm -it \
    -e MANIFEST_DATA=$MANIFEST_DATA \
    -e KUBECONFIG_DATA=$KUBECONFIG_DATA \
    quving/kube-yaml-manifest:latest
```


