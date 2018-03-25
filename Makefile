ENV   = staging
FUNCS = hello world

deploy: build
	serverless deploy --stage $(ENV) --verbose

deploy-function: $(FUNC)
	serverless deploy function --function $(FUNC) --stage $(ENV) --verbose

build: $(FUNCS)

$(FUNCS):
	GOOS=linux GOARCH=amd64 go build -o bin/$@ $@/main.go

destroy:
	serverless remove --stage $(ENV) --verbose

staging: ENV=staging
staging: deploy

production: ENV=production
production: deploy

.PHONY: $(FUNCS)
