# Dockerized Go Application with CI/CD and Terraform

This repository contains a Dockerized Go application with an efficient Docker image. It leverages GitHub Actions for automated testing, building, and pushing the Docker image to a private Amazon ECR. After the image is pushed, an email notification is sent to the user. Additionally, Terraform is used to automate the deployment of a Kubernetes cluster.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [GitHub Actions](#github-actions)
- [Terraform](#terraform)
- [Image](#image)

## Features

- Dockerized Go application with an optimized Docker image.
- GitHub Actions for automated CI/CD pipeline.
- Email notifications upon successful image push.
- Terraform configurations for automated Kubernetes cluster deployment.

## Prerequisites

- Docker installed on your local machine.
- AWS CLI configured with necessary permissions.
- GitHub account with repository access.
- Terraform installed for infrastructure automation.
- Kubectl installed for interacting with Kubernetes.

## Setup

1. **Clone the Repository**:

   Clone this repository to your local machine.

2. **Set Up AWS CLI**:

   Ensure your AWS CLI is configured with the necessary permissions to push to ECR and manage Kubernetes resources.

3. **Install Dependencies**:

   Ensure you have Docker, GitHub CLI, Terraform, and kubectl installed on your machine.

## Usage

### GitHub Actions

![image](https://github.com/user-attachments/assets/e8040f66-f340-41a0-ac06-e27066a68f84)
![image](https://github.com/user-attachments/assets/0b28e9ab-7e77-4bc7-9aa7-19506be8cf3c)
![image](https://github.com/user-attachments/assets/61224fa6-59c6-44d1-996d-d8470cf913c2)

The GitHub Actions workflow is configured to automate the following processes:

1. **Testing**: Runs automated tests on the Go application.
2. **Building**: Builds the Docker image for the application.
3. **Pushing to ECR**: Pushes the Docker image to a private Amazon ECR repository.
4. **Email Notification**: Sends an email notification upon successful completion of the image push.

You can find the workflow configuration in the `.github/workflows` directory. This setup ensures that every push to the repository triggers the CI/CD pipeline, automating the deployment process.

### Terraform

The Terraform configuration automates the deployment of a Kubernetes cluster. The configuration files are located in the `terraform` directory.

- **EKS Cluster**: The Terraform scripts create an EKS cluster with the necessary node groups.
- **Networking**: Subnets and VPC configurations are managed automatically.

#### Deploying with Terraform

1. **Initialize Terraform**:

   Run `terraform init` to initialize the Terraform configuration.

2. **Apply Terraform Configuration**:

   Run `terraform apply` to create the necessary Kubernetes cluster and other infrastructure as defined in the Terraform configuration files.


