
# Kubernetes CI/CD Pipeline with AWS EKS, Helm, Jenkins, Prometheus, and Grafana

This project shows how to set up a full DevOps pipeline to deploy a Python Flask app that's been containerized. It uses a Kubernetes cluster running on AWS EKS, and includes tools like Jenkins for CI/CD, Prometheus and Grafana for monitoring, and Helm charts to automate the deployment process. Everything is set up using Infrastructure as Code to keep things organized and repeatable.

---

## Key Components

### Microservice (Flask)
A simple Python Flask application serves as the example microservice. It has a single route (`/`) that returns a welcome message. This app is containerized using Docker and deployed to Kubernetes via Helm.

### Kubernetes (AWS EKS)
Amazon EKS is used to host the Kubernetes cluster. The cluster is configured using the AWS CLI and deployed using an `eks-cluster-create.sh` script. Namespaces, deployments, and services are defined in manifest files under the `k8s/` directory.

### Helm
Helm is used to package the Kubernetes manifests into a reusable chart. This makes deployments more manageable and repeatable. You can upgrade or rollback deployments with ease using Helm commands.

### Jenkins CI/CD
Jenkins is configured as a pod inside the Kubernetes cluster. A Jenkinsfile defines a pipeline that:
- Clones the project from GitHub
- Builds and pushes the Docker image
- Deploys the application using Helm

### Monitoring with Prometheus and Grafana
- **Prometheus** is configured to scrape metrics from the Flask application
- **Grafana** is set up with Prometheus as a data source and pre-configured to visualize metrics like response times, container health, and request rates

---

## Folder Structure

```
k8s_cicd_pipeline/
├── app/                          # Flask app and Dockerfile
├── helm/                         # Helm chart to deploy the app
├── k8s/                          # Raw Kubernetes manifests
├── jenkins/                      # Jenkins pipeline definition
├── monitoring/                   # Prometheus & Grafana config
├── scripts/                      # Shell scripts for automation
└── README.md
```

---

##  How to Deploy

### 1. Build and Push Docker Image
```bash
cd app
docker build -t your-dockerhub-user/flask-app:latest .
docker push your-dockerhub-user/flask-app:latest
```

### 2. Create EKS Cluster
```bash
chmod +x scripts/eks-cluster-create.sh
./scripts/eks-cluster-create.sh
```

### 3. Deploy Application via Helm
```bash
chmod +x scripts/helm-install.sh
./scripts/helm-install.sh
```

### 4. Deploy Jenkins in Kubernetes
You can deploy Jenkins using:
```bash
helm repo add jenkinsci https://charts.jenkins.io
helm install jenkins jenkinsci/jenkins --namespace dev
```
Access Jenkins and configure credentials (`dockerhub-creds`) for Docker authentication.

### 5. Configure Prometheus & Grafana
```bash
helm install prometheus prometheus-community/prometheus -f monitoring/prometheus-values.yaml --namespace dev
helm install grafana grafana/grafana -f monitoring/grafana-values.yaml --namespace dev
```
---
### Credentials
AWS, DockerHub, and Jenkins credentials are **NOT included**. 
---
### Contact
Created by Jayanth Manthrigalla. For questions or feedback, reach out via GitHub.