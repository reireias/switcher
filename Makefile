NAME := switcher

export GO111MODULE=on

.PHONY: deps
deps:
	@go get -v -d

.PHONY: devel-deps
devel-deps: deps
	@GO111MODULE=off go get \
		golang.org/x/lint/golint \
		github.com/motemen/gobump/cmd/gobump

bin/%: cmd/%/main.go deps
	@go build

.PHONY: build
build: bin/switcher

.PHONY: lint
lint: devel-deps
	go vet ./...
	golint -set_exit_status ./...

.PHONY: install
install:
	@go install ./cmd/switcher

.PHONY: version-up-major
version-up-major:
	@gobump major -w cmd/switcher

.PHONY: version-up-minor
version-up-minor:
	@gobump minor -w cmd/switcher

.PHONY: version-up-patch
version-up-patch:
	@gobump patch -w cmd/switcher
