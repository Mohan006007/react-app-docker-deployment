# React App Docker Deployment

## Project Overview
This project showcases a complete CI/CD pipeline for deploying a React application using Docker, Jenkins, and AWS. It also integrates robust monitoring and alerting systems for effective application management.

## Live Application
Access the live application here: [React App - Live Deployment](http://65.2.123.191:80).

## Features

### 1. **Application Deployment**
- React app running in a Docker container on port 80 (HTTP).
- Hosted on a dedicated AWS EC2 instance.

### 2. **Docker Workflow**
- Dockerized React app using a custom `Dockerfile`.
- `docker-compose.yml` simplifies multi-container management.
- Two Docker Hub repositories:
  - Public repository for development: `mohan006007/dev:latest`.
  - Private repository for production: `mohan006007/prod:latest`.

### 3. **Version Control**
- Git workflow with two branches:
  - `dev` branch for development.
  - `master` branch for production.
- Includes `.gitignore` and `.dockerignore` to streamline version control.

### 4. **CI/CD with Jenkins**
- Automated build and deployment processes:
  - **Development**: Code pushed to `dev` → Image pushed to `dev` repo.
  - **Production**: `dev` merged into `master` → Image pushed to `prod` repo.
- Build and deployment scripts:
  - `build.sh`: Automates Docker image creation.
  - `deploy.sh`: Handles deployment of the image to the server.

### 5. **AWS Infrastructure**
- **React Deployment Instance** (t2.medium):
  - Runs Jenkins, Docker, Prometheus, Grafana, and AlertManager for efficient CI/CD and monitoring resources.
- **React App Instance** (t2.micro):
  - Dedicated to running the React app and Node Exporter.

### 6. **Monitoring and Alerts**
- **Prometheus**: Collects metrics from the React App instance via Node Exporter.
- **Grafana**: Visualizes metrics through dynamic dashboards.
- **Node Exporter**: Monitors the React App instance's health.
- **AlertManager**: Sends email notifications for server downtime or performance issues.

## Repository Structure
- **Branches**:
  - `dev`: For development workflow.
  - `master`: For production-ready workflow.
- **Key Files**:
  - `Dockerfile`: Defines the React app's container.
  - `docker-compose.yml`: Configures multi-container setups.
  - `Jenkinsfile`: CI/CD pipeline configuration.
  - `screenshots/`: Contains project-related visuals.

## Monitoring System
- **Prometheus**: Collects application and server metrics.
- **Grafana**: Displays metrics on real-time dashboards.
- **AlertManager**: Notifies via email when the application or server is down.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/Mohan006007/react-app-docker-deployment.git
