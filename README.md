# Bookstore API --- Dockerized Flask Application with MySQL & Terraform Deployment

## Overview

This project delivers a fully containerized Bookstore REST API built
with Python Flask and backed by MySQL. The original API code was
provided, and the rest of the infrastructure --- containerization,
multi-service orchestration, automated provisioning, and AWS deployment
using Terraform --- was built to create a reproducible development and
deployment environment.

## Key Components Delivered

### 1. Dockerfile (Flask API Image)

A production-ready Dockerfile packages the Flask application: - Python
base image\
- Dependency installation via `requirements.txt`\
- Application code copied into the container\
- Port **80** exposed for web access\
- Application entrypoint defined

### 2. Docker Compose (Multi-Container Stack)

The `docker-compose.yml` orchestrates: - Flask API service\
- MySQL database service\
- Custom Docker network for inter-service communication\
- Environment variables and persistent volumes for MySQL\
- Port mapping that exposes the API on **port 80**

### 3. Terraform Infrastructure (IaC)

Terraform configuration provisions the AWS environment: - Amazon Linux 2
EC2 instance\
- Security Group allowing required inbound traffic\
- Resource tagging for identification\
- Automated output of the public API endpoint

### 4. User-Data Bash Script (Automated Server Bootstrap)

The EC2 instance uses a user-data script to automatically configure the
environment at launch: - System update\
- Installation of Docker and Docker Compose\
- Docker service startup\
- Git clone of the application repo\
- Deployment of the application using Docker Compose

## Tech Stack

-   Python Flask\
-   MySQL\
-   Docker & Docker Compose\
-   Terraform\
-   AWS EC2\
-   Bash scripting\
-   Git & GitHub

## Project Structure

    .
    ├── bookstore-api.py        # Provided Flask API
    ├── requirements.txt        # Python dependencies
    ├── Dockerfile              # Docker image for Flask API
    ├── docker-compose.yml      # Multi-container configuration
    ├── main.tf                 # Terraform configuration
    └── README.md               # Documentation

## Skills Demonstrated

-   Containerization of Python applications\
-   Multi-service orchestration with Docker Compose\
-   Infrastructure as Code using Terraform\
-   Automated provisioning using bash scripting\
-   AWS compute and security configuration\
-   Deployment of containerized applications in the cloud
