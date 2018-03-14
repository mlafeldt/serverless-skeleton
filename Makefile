ENV = dev

deploy: build
	serverless deploy --stage $(ENV) --verbose

deploy-function: $(FUNC)
	serverless deploy function --function $(FUNC) --stage $(ENV) --verbose

build: hello world

hello world:
	GOOS=linux go build -ldflags="-s -w" -o bin/$@ $@/main.go

destroy:
	serverless remove --stage $(ENV) --verbose

dev: ENV=dev
dev: deploy

prod: ENV=prod
prod: deploy

destroy-dev: ENV=dev
destroy-dev: destroy

destroy-prod: ENV=prod
destroy-prod: destroy

.PHONY: hello world
