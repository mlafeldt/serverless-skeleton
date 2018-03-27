# Serverless Skeleton

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

# Deploy a single function from the service to staging
$ make deploy-function FUNC=hello

# Deploy a single function from the service to production
$ make deploy-function FUNC=hello ENV=production

# Print staging endpoint URL
$ make url

# Print production endpoint URL
$ make url ENV=production

# Invoke a deployed function in staging
$ serverless invoke --function hello

# Invoke a deployed function in production
$ serverless invoke --function hello --stage production

# Remove the service and all AWS resources from staging
$ make destroy

# Remove the service and all AWS resources from production
$ make destroy ENV=production
```
