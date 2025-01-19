# React App Docker Deployment

## Project Overview  
This project demonstrates a complete **CI/CD pipeline** for deploying a **React application** using **Docker**, **Jenkins**, and **AWS**. It integrates automated deployment, real-time monitoring, and alerting for effective application management.

---

## Live Application  
Access the live application here: [React App - Live Deployment](http://65.2.123.191:80).

---

## Key Features  
- **Fully Automated CI/CD Pipeline**: Streamlined build, test, and deployment processes with Jenkins.
- **Scalable Containerization**: Dockerized React app using a custom `Dockerfile` and `docker-compose.yml` for easy deployment and scaling.
- **Multi-Environment Deployment**: Separate Docker Hub repositories for development (`dev`) and production (`prod`) environments.
- **Real-Time Monitoring**: **Prometheus** collects performance metrics, and **Grafana** visualizes them with dynamic dashboards.
- **Automated Alerts**: **AlertManager** sends email notifications for server downtime or performance issues.
  
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

## Setup and Installation

### 1. Clone the Repository
Clone this repository to your local machine:  
   ```bash  
   git clone https://github.com/Mohan006007/react-app-docker-deployment.git  
   cd react-app-docker-deployment
   ```
2. Install dependencies
   ```bash
   npm install
3. Start the application locally
   ```bash
   npm start
4. Access the application at `http://localhost:80`     
   
## Docker Workflow  
- The React app is dockerized using a custom `Dockerfile`.  
- The `docker-compose.yml` simplifies multi-container management.  
- Two Docker Hub repositories:  
  - **Development**: `mohan006007/dev:latest`  
  - **Production**: `mohan006007/prod:latest`  

---

## CI/CD with Jenkins (Multibranch Pipeline)

### 1. Automated Build and Deployment  
- **Development**: Code pushed to `dev` → Image pushed to `dev` Docker Hub repository.  
- **Production**: `dev` merged into `master` → Image pushed to `prod` Docker Hub repository.  

### 2. Jenkins Multibranch Pipeline  
A Jenkins multibranch pipeline is configured to automatically build and deploy the application based on branch pushes.  

### 3. Webhooks  
**Webhooks** are configured in **GitHub** to automatically trigger Jenkins builds on every code push to the respective branches.  

### 4. Build and Deployment Scripts  
- **`build.sh`**: Automates Docker image creation.  
- **`deploy.sh`**: Pushes the Docker image to the Docker Hub repository.

---

## AWS Infrastructure

- **React Deployment Instance** (t2.medium):  
  Runs **Jenkins**, **Docker**, **Prometheus**, **Grafana**, and **AlertManager** for efficient CI/CD and monitoring.  

- **React App Instance** (t2.micro):  
  Dedicated to running the React application with **Node Exporter** for monitoring.  

---

## Monitoring and Alerts

- **Prometheus**: Collects metrics from the React App instance via **Node Exporter**.  
- **Grafana**: Displays the metrics on real-time, dynamic dashboards.  
- **AlertManager**: Sends email notifications when the application or server experiences issues or downtime.  

---

## Repository Structure

- **Branches**:
  - `dev`: Development workflow.  
  - `master`: Production-ready workflow.  

- **Key Files**:
  - `Dockerfile`: Defines the React app's container.  
  - `docker-compose.yml`: Configures multi-container setups.  
  - `Jenkinsfile`: CI/CD pipeline configuration.  
  - `screenshots/`: Contains project-related visuals.  

---

## Conclusion  
This project demonstrates a robust **CI/CD pipeline** for deploying a **React application** using **Docker**, **Jenkins**, and **AWS**. With automated builds, multi-environment workflows, and powerful monitoring using **Prometheus**, **Grafana**, and **AlertManager**, this setup ensures seamless deployment and management of your application.
