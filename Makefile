export GRPC_GO_LOG_VERBOSITY_LEVEL=99
export GRPC_GO_LOG_SEVERITY_LEVEL=info

NAME=event-publisher

PORT?=50051

build:
	docker build -t phisuite/${NAME} .

start:
	docker run --rm -it -p ${PORT}:50051 phisuite/${NAME}

publish:
ifdef VERSION
	docker tag phisuite/${NAME} phisuite/${NAME}:${VERSION} && \
	docker push phisuite/${NAME}:latest && \
	docker push phisuite/${NAME}:${VERSION}
else
	echo "VERSION not defined"
endif

debug:
	go run ./src --port ${PORT}
