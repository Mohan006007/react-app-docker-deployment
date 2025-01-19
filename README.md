# React App Docker Deployment

## Project Overview
This project showcases a complete CI/CD pipeline for deploying a React application using Docker, Jenkins, and AWS. It also integrates robust monitoring and alerting systems for effective application management.

---

## Live Application
Access the live application here: [React App - Live Deployment](http://65.2.123.191:80).

---

### Technologies Used
- **Docker** and **Docker Compose** for containerization  
- **GitHub** for version control  
- **Jenkins** for CI/CD automation  
- **AWS EC2** for hosting and deployment  
- **Prometheus** and **Grafana** for monitoring and alerting

---

## Prerequisites
Ensure the following are installed or configured:  
1. **Docker** and **Docker Compose** (Install [Docker](https://docs.docker.com/get-docker/))  
2. **Node.js** and **npm** (Install [Node.js](https://nodejs.org/))  
3. An **AWS EC2 instance** with a public IP  
4. A **Docker Hub account** for storing images  
5. **Jenkins** installed and configured ([Jenkins Setup Guide](https://www.jenkins.io/doc/))  
6. **Prometheus** and **Grafana** installed and configured for application health checks  

---

## Application Setup
1. Clone this repository to your local machine:  
   ```bash
   git clone https://github.com/Mohan006007/react-app-docker-deployment.git
   cd react-app-docker-deployment
2. Install dependencies
   ```bash
   npm install
3. Start the application locally
   ```bash
   npm start
4. Access the application at `http://localhost:80`     
   
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
- Merge Strategy: `.gitattributes` in the master branch ensures files like Jenkinsfile, Dockerfile, etc., are preserved during merges from dev.

### 4. **CI/CD with Jenkins**
- Automated build and deployment processes:
  - **Development**: Code pushed to `dev` → Image pushed to `dev` repo.
  - **Production**: `dev` merged into `master` → Image pushed to `prod` repo.
  - Multibranch Jenkins pipeline ensures automatic triggers and builds based on the branch pushed to.
  - Webhooks are configured in GitHub to automatically trigger Jenkins builds on every code push in the respective branches.
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

## Conclusion
   This project demonstrates how to set up a complete CI/CD pipeline for deploying a React application using Docker, Jenkins, and AWS. Features include automated builds, multi-environment Docker workflows, and       robust monitoring with Prometheus, Grafana, and AlertManager.
