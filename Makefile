NAME := switcher
VERSION := $(godump show -r cmd/switcher)
REVISION := $(shell git rev-parse --short HEAD)
LDFLAGS := "-X main.version=$(VERSION) -X main.revision=$(REVISION)"

export GO111MODULE=on

.PHONY: deps
deps:
	@go get -v -d

.PHONY: deps
devel-deps: deps
	@GO111MODULE=off go get \
		golang.org/x/lint/golint \
		github.com/motemen/gobump/cmd/gobump

bin/%: cmd/%/main.go deps
	@go build -ldflags $(LDFLAGS) -o $@ $<

.PHONY: build
build: bin/switcher

.PHONY: lint
lint: devel-deps
	go vet ./...
	golint -set_exit_status ./...

.PHONY: install
install:
	@go install $(LDFLAGS) ./cmd/switcher

.PHONY: bump-major
bump-major:
	@gobump major -w cmd/switcher

.PHONY: bump-minor
bump-minor:
	@gobump minor -w cmd/switcher

.PHONY: bump-patch
bump-patch:
	@gobump patch -w cmd/switcher

.PHONY: release
release:
	@git tag v$(VERSION)
	@git push --tags
	goreleaser --rm-dist
