ENV   = staging
FUNCS = hello world

staging: ENV=staging
staging: deploy

production: ENV=production
production: deploy

deploy: build
	serverless deploy --stage $(ENV) --verbose

deploy-function: $(FUNC)
	serverless deploy function --function $(FUNC) --stage $(ENV) --verbose

destroy:
	serverless remove --stage $(ENV) --verbose

url:
	@aws cloudformation describe-stacks \
		--stack-name serverless-skeleton-$(ENV) \
		--query "Stacks[0].Outputs[?OutputKey == 'ServiceEndpoint'].OutputValue" \
		--output text

build: $(FUNCS)

$(FUNCS):
	GOOS=linux GOARCH=amd64 go build -o bin/$@ ./$@

test:
	go vet ./...
	go test -v -cover ./...

.PHONY: $(FUNCS)
