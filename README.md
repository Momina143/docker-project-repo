# Kubernetes Microservices Phonebook Application (Python + MySQL + Docker + K8S)

A fully containerized, microservices-based Phonebook application
deployed on a Kubernetes cluster. The application code (`app.py`) was
provided, but the entire DevOps architecture, containerization,
Kubernetes configuration, and cloud deployment were implemented by me.

------------------------------------------------------------------------

## Features & Overview

This project consists of three microservices:

### 1️ Webserver Service (CRUD UI)

-   Add/Update/Delete phonebook entries
-   Python Flask (app provided)
-   Dockerized and deployed using Kubernetes

### 2️ Resultserver Service (Search UI)

-   Search phonebook records
-   Python Flask (app provided)
-   Dockerized and deployed using Kubernetes

### 3️ MySQL Database Service

-   Stores all phonebook records
-   PersistentVolume + PersistentVolumeClaim
-   Exposed internally via ClusterIP service

------------------------------------------------------------------------

## Architecture Diagram
                          ┌───────────────────────────┐
                          │        Users / Web        │
                          └───────────────┬───────────┘
                                          │
                                  Ingress Controller
                                          │
                   ┌──────────────────────┼────────────────────────┐
                   │                                               │
                   │                                               │
       ┌───────────▼─────────────┐                    ┌────────────▼───────────┐
       │     Webserver UI        │                    │    Resultserver UI     │
       │  (CRUD Interface)       │                    │   (Search Interface)   │
       │  Service: NodePort      │                    │    Service: NodePort   │
       └────────────┬────────────┘                    └────────────┬───────────┘
                    │                                              │
                    └────────────────────────┬─────────────────────┘
                                             │
                                 ┌───────────▼────────────┐
                                 │      MySQL Service     │
                                 │     Service: ClusterIP │
                                 │  PersistentVolumeClaim │
                                 └───────────┬────────────┘
                                             │
                                     PersistentVolume


------------------------------------------------------------------------

## Technologies Used

-   Kubernetes (Deployments, Services, PV/PVC, Ingress, Secrets,
    ConfigMaps)
-   Docker
-   Python Flask
-   MySQL
-   Nginx Ingress Controller
-   AWS EC2 (Master + Worker nodes)
-   AWS Route53

------------------------------------------------------------------------

## DevOps Responsibilities

The app code was provided---but all DevOps work was done by me:

### 1 Containerization

-   Wrote Dockerfiles
-   Built and pushed images to Docker Hub

### 2 Kubernetes Architecture

-   Designed microservice layout
-   Implemented deployments, services, PV/PVC
-   Managed secrets and configmaps

### 3 Ingress & Domain Routing

-   Installed Nginx Ingress Controller
-   Configured path-based routing
-   Connected custom domain via Route53

### 4 Cloud Infrastructure

-   Provisioned EC2-based Kubernetes cluster
-   Managed security groups
-   Troubleshot networking issues

------------------------------------------------------------------------

## Folder Structure

    phonebook-application/
    │
    ├── database/
    │   ├── mysql-deploy.yml
    │   ├── mysql-pv.yml
    │   ├── mysql-pvc.yml
    │   ├── mysql-configmap.yml
    │   ├── mysql-secret.yml
    │   └── mysql-svc.yml
    │
    ├── image_for_web_server/
    │   ├── Dockerfile
    │   ├── app.py
    │   ├── templates/
    │   ├── webserver-configmap.yml
    │   ├── webserver-deploy.yml
    │   └── webserver-svc.yml
    │
    ├── image_for_result_server/
    │   ├── Dockerfile
    │   ├── app.py
    │   ├── templates/
    │   ├── resultserver-deploy.yml
    │   └── resultserver-svc.yml
    │
    └── ingress.yml

------------------------------------------------------------------------

