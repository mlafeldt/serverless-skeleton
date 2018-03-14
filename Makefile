deploy: build
	serverless deploy -v

build:
	GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go
