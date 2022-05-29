TOOLS = $(shell go list -f '{{ join .Imports " " }}' -tags=tools)
TOOLS_BIN = ./bin

.PHONY: build/kubebuilder
build/kubebuilder:
	CGO_ENABLED=0 go build -o ${TOOLS_BIN}/kubebuilder -v -tags='osusergo,netgo,static' -ldflags='-s -w -buildid= "-extldflags=-static"' ${TOOLS}

namespaced:
	cd namespaced; \
		../bin/kubebuilder init --project-version 3 --plugins='base.go.kubebuilder.io/v3,kustomize.common.kubebuilder.io/v2-alpha' --domain 'zchee.io' --license 'apache2' --owner 'kubebuilder-init' --project-name 'namespaced' --repo 'github.com/zchee/kubebuilder-init/namespaced' --fetch-deps --component-config --skip-go-version-check
	cd namespaced; \
		../bin/kubebuilder --plugins='base.go.kubebuilder.io/v3,kustomize.common.kubebuilder.io/v2-alpha' create api --controller --namespaced --resource --group 'ship' --kind 'Frigate' --make 'false' --version 'v1alpha1'
	cd namespaced; \
		make manifests generate; make all

non-namespaced:
	cd non-namespaced; \
		../bin/kubebuilder init --project-version 3 --plugins='base.go.kubebuilder.io/v3,kustomize.common.kubebuilder.io/v2-alpha' --domain 'zchee.io' --license 'apache2' --owner 'kubebuilder-init' --project-name 'non-namespaced' --repo 'github.com/zchee/kubebuilder-init/non-namespaced' --fetch-deps --component-config --skip-go-version-check
	cd namespaced; \
		../bin/kubebuilder --plugins='base.go.kubebuilder.io/v3,kustomize.common.kubebuilder.io/v2-alpha' create api --controller --namespaced=false --resource --group 'ship' --kind 'Frigate' --make 'false' --version 'v1alpha1'
	cd namespaced; \
		make manifests generate; make all
