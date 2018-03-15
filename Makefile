ENV = staging

deploy: build
	serverless deploy --stage $(ENV) --verbose

deploy-function: $(FUNC)
	serverless deploy function --function $(FUNC) --stage $(ENV) --verbose

build: hello world

hello world:
	GOOS=linux go build -ldflags="-s -w" -o bin/$@ $@/main.go

destroy:
	serverless remove --stage $(ENV) --verbose

staging: ENV=staging
staging: deploy

production: ENV=production
production: deploy

.PHONY: hello world
