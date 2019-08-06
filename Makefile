default: build

.PHONY: build
build: module
	@go build

.PHONY: module
module:
	@export GO111MODULE=on
	@go get

.PHONY: install
install:
	@go install
