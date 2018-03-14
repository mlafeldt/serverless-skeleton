package main

import (
	"log"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func Handler(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	log.Printf("%+v", req)
	return events.APIGatewayProxyResponse{Body: "Hello World!", StatusCode: 200}, nil
}

func main() {
	lambda.Start(Handler)
}
