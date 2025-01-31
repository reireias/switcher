NAME := switcher

.PHONY: deps
deps:
	@go get -v

.PHONY: devel-deps
devel-deps: deps
	@go install honnef.co/go/tools/cmd/staticcheck@latest

.PHONY: build
build:
	@go build -o bin/$(NAME) ./cmd/$(NAME)

.PHONY: lint
lint: devel-deps
	go vet ./...
	staticcheck ./...

.PHONY: install
install:
	@go install
