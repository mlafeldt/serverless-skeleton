ENV   = staging
FUNCS = hello world # add your functions here
STACK = $(shell awk '/service:/ {print $$2}' serverless.yml)

staging: ENV=staging
staging: deploy

production: ENV=production
production: deploy

deploy: test build
	serverless deploy --stage $(ENV) --verbose

deploy_funcs = $(FUNCS:%=deploy-%)

$(deploy_funcs): deploy-%: test-% build-%
	serverless deploy function --function $(@:deploy-%=%) --stage $(ENV) --verbose

destroy:
	serverless remove --stage $(ENV) --verbose

url:
	@aws cloudformation describe-stacks --stack-name $(STACK)-$(ENV) \
		--query "Stacks[0].Outputs[?OutputKey == 'ServiceEndpoint'].OutputValue" \
		--output text

build_funcs = $(FUNCS:%=build-%)

build: $(build_funcs)

$(build_funcs):
	GOOS=linux GOARCH=amd64 go build -o bin/$(@:build-%=%) ./$(@:build-%=%)

test:
	go vet ./...
	go test -v -cover ./...

test_funcs = $(FUNCS:%=test-%)

$(test_funcs):
	go vet ./$(@:test-%=%)
	go test -v -cover ./$(@:test-%=%)
