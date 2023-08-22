# The OpenTelemetry Demo on kind with the collector configured to send to Elastic

[OpenTelemetry Demo](https://opentelemetry.io/docs/demo/)

## Requirements

* docker
* [kind](https://kind.sigs.k8s.io) installed locally in this folder - tested with 0.20.0
* [helm](https://kind.sigs.k8s.io) -- tested with 3.8.0

## Install

1. Create a new K8s cluster with kind
    
    ```bash
    ./up.sh
    ```
    
2. Create a secret with you Elastic APM endpoint and APM secret token:
    
    ```bash
    kubectl create secret generic elastic-secret \                      
    --from-literal=elastic_apm_endpoint='https://your_elastic_APM_endpoint:443' \
    --from-literal=elastic_apm_secret_token='your_APM_secret_token'
    ```
    
3. Get the OpenTelemetry demo helm charts locally
    
    ```bash
    helm pull --untar open-telemetry/opentelemetry-demo
    ```
    
4. Patch the OpenTelemetry-collector chart to allow Feature Flags -- tested with  OpenTelemetry Collector helm chart version 0.65.1
    
    ```bah
    patch -ruN -d . < otel-col-charts-template-pod.patch
    patch -ruN -d . < otel-col-charts-template-pod.patch
    ```
    
5. Install the `otel-demo` release
    ```bash
    helm upgrade --install otel-demo opentelemetry-demo --values values.yaml
    ```
    
6. Explore !
7. Tear down everything
    
    ```bash
    .\down.sh
    ```

## Miscellaneous

`OpenTelemetry Collector Metrics.ndjson` is a Kibana Dashboard (8.9.1) to see the receiver and exporter metrics of the Otel Collector.
