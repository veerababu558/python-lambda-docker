# python-lambda-docker

# Title 
Building CI/CD Deployment Pipeline for Dockerized FastAPI Python Application on AWS Lambda

#Overview
This project demonstrates how to set up a complete CI/CD pipeline for a containerized Python FastAPI application deployed on AWS Lambda using GitHub Actions. It uses GitHub Codespaces for development and leverages AWS Elastic Container Registry (ECR) to host the container image.

# Technologies Used

- GitHub Codespaces
- Python (FastAPI)
- Docker
- AWS Lambda (Container image-based)
- Amazon Elastic Container Registry (ECR)
- AWS IAM
- GitHub Actions (CI/CD)

# Key Features
- Developed project using GitHub Codespaces — no need to install Docker or Python locally
- CI/CD pipeline with GitHub Actions to deploy automatically on code commit
- Deployed to AWS Lambda as a container image
- Function URL used to invoke Lambda directly -  no API Gateway needed
- Fully containerized application, portable to any compute platform

# Prerequisites
- GitHub account
- AWS account
- AWS CLI configured locally (to push docker image to ECR manually)

# Setup Steps
1. Create ECR Repository
 - Go to AWS Console → ECR → Create Repository
   Name : fastapi-python-lambda
2. Create AWS Lambda Function
 - Go to AWS Console → Lambda → Create Function
 - Choose Container image as the deployment type
 - Provide the ECR URI (We will push the Docker image manually first)
3. Enable Function URL
 - Go to your Lambda function → Configuration → Function URL
 -  Enable it to test the Lambda without API Gateway
4. Go to IAM → Create a user/role with permissions:
    



