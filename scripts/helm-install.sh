#!/bin/bash
kubectl create namespace dev
helm upgrade --install flask-app helm/microservice-chart/ --namespace dev