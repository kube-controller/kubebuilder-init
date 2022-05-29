TOOLS = $(shell go list -f '{{ join .Imports " " }}' -tags=tools)
TOOLS_BIN = ./bin

.PHONY: build/kubebuilder
build/kubebuilder:
	CGO_ENABLED=0 go build -o ${TOOLS_BIN}/kubebuilder -v -tags='osusergo,netgo,static' -ldflags='-s -w -buildid= "-extldflags=-static"' ${TOOLS}
