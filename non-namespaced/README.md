# non-namespaced

```console
$ kubebuilder version
Version: version.Version{KubeBuilderVersion:"2.2.0", KubernetesVendor:"1.15.5", GitCommit:"0824a139f59e109c9e418a0b6e71a53c6e9e144f", BuildDate:"2019-11-20T00:00:24Z", GoOs:"unknown", GoArch:"unknown"}

$ kubebuilder init --domain zchee.io --license apache2 --skip-go-version-check
$ kubebuilder create api --group ship --version v1alpha1 --kind Frigate --namespaced=false
```
