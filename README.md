# Serverless Skeleton

[![CircleCI](https://circleci.com/gh/mlafeldt/serverless-skeleton.svg?style=svg)](https://circleci.com/gh/mlafeldt/serverless-skeleton)

A skeleton project that shows how to use the [Serverless Framework](https://serverless.com/framework/) with Go.

Also see [this blog post](https://serverless.com/blog/framework-example-golang-lambda-support/) for more information.

## Usage

```bash
# Set AWS credentials and region
$ export AWS_ACCESS_KEY_ID=...
$ export AWS_SECRET_ACCESS_KEY=...
$ export AWS_REGION=...

# Deploy the Serverless service to staging
$ make staging

# Deploy the service to production
$ make production

# Build, test, deploy, or invoke a single function from the service (in staging)
$ make build-hello
$ make test-hello
$ make deploy-hello
$ serverless invoke --function hello

# Print staging endpoint URL
$ make url

# Remove the service and all AWS resources from staging
$ make destroy

# To operate in production instead of staging
$ make ... ENV=production
$ serverless ... --stage production
```
