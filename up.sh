#!/usr/local/bin/bash

echo "Deleting a kind cluster named otel-demo..."
./kind delete cluster --name otel-demo

echo "Creating a kind cluster named otel-demo..."
./kind create cluster --config kind-config.yaml --name otel-demo
