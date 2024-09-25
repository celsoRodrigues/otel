#!/bin/bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm repo update

helm upgrade open-telemetry-operator open-telemetry/opentelemetry-operator \
  --install --atomic --timeout 5m \
  --create-namespace --namespace kube-monitoring \
  --values ./otel_operator_values.yaml

kubectl apply ../basicApp/manifests/

