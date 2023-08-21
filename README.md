# Longhornsystembackup

## What's here?
As can be easily guessed, the container creates a [longhornsystembackup](https://longhorn.io/docs/1.5.1/advanced-resources/system-backup-restore/backup-longhorn-system/) for a given kubeconfig.

## Usage

### Environment Variables

In this example $KUBECONFIG_DATA is the base64 encoded string based on the kubeconfig.

Example:
```bash
cat $FILE | base64
```

Run the container:
```bash
docker run --rm -it \
    -e KUBECONFIG_DATA=$KUBECONFIG_DATA \
    quving/longhornsystembackup:latest
```


