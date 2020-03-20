package main

import (
	"context"
	"github.com/phiskills/grpc-api.go"
	"github.com/phisuite/data.go"
	"log"
)

type eventServer struct {
	data.UnimplementedEventAPIServer
}

func (e eventServer) Publish(_ context.Context, event *data.Event) (*data.Event, error) {
	log.Printf("Publish: %v", event)
	return event, nil
}

func main() {
	api := grpc.New()
	data.RegisterEventAPIServer(api.Server, &eventServer{})
	api.Start()
}
