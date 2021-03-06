# serverless-template

## building docker image for github actions

```bash
# format
[IMAGE=<image name override>] ./build-docker-image.sh -v <image version> -n <node version> -y <yarn version>

# example
IMAGE=listgr/serverless ./build-docker-image.sh -v 1.0.0 -n 12.18.3 -y v1.22.4
```

You will need to update files under `.github/workflows` to correctly refer to your serverless docker image.

## trigger github actions

```bash
# format
./scripts/git-deploy.sh <stage [<stage> [...]]>

# examples
./scripts/git-deploy.sh prototype
./scripts/git-deploy.sh dev uat prod
```

## Github Actions configurations

Under Github page, navigate to `settings` and then hit `secrets`. Add the following secrets:

1. `AWS_ACCESS_KEY_ID` for your AWS access key id
2. `AWS_SECRET_ACCESSE_KEY` for your AWS secret access key
3. `AWS_REGION` for AWS region

## adding more files

`./scripts/archive.sh` needs to be updated if you add files for your application. It is a good idea to group them under the same directory, like `./src` or `./lib`, so you don't need to update this file everytime a file is added.
