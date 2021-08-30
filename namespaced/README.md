# namespaced

```console
$ kubebuilder version
Version: main.version{KubeBuilderVersion:"v3.0.0-alpha.0-312-g5ca8884a", KubernetesVendor:"unknown", GitCommit:"5ca8884a1929e2995e10339fc87122b1ccabefa1", BuildDate:"2021-08-30T14:34:45Z", GoOs:"darwin", GoArch:"amd64"}

$ kubebuilder --plugins go/v3 init --component-config --fetch-deps --license apache2 --owner 'The kubebuilder-init Authors' --project-version 3 --repo 'github.com/zchee/kubebuilder-init/namespaced' --skip-go-version-check
$ kubebuilder --plugins go/v3 create api --controller --crd-version v1 --group ship --make false --kind Frigate --namespaced --resource --version v1alpha1
```
