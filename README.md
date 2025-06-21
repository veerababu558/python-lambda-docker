# python-lambda-docker

# Title 
Building CI/CD Deployment Pipeline for Dockerized FastAPI Python Application on AWS Lambda

# Overview
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
    
 - Generate Access Key ID and Secret Access Key
5. Setup GitHub Codespaces
 - Create a GitHub repo: python-lambda-docker
 - Open the repo in Codespaces
 - Build the project using the pre-installed Docker environment
 - 6. 🧱 Project Structure

python-lambda-docker/
├── app/
│   └── main.py         # FastAPI app with /hello route
├── requirements.txt    # fastapi + mangum
├── Dockerfile          # AWS Lambda-compatible Docker build
└── .github/workflows/deploy.yml # GitHub Actions CI/CD workflow

7. Docker Build & Run Locally From Codespaces terminal

   docker build -t fastapi-python-lambda .
   
   docker run -p 9000:8080 fastapi-python-lambda
   
10. Test the Lambda-style endpoint locally from Codespaces terminal
    
 curl -XPOST http://localhost:9000/2015-03-31/functions/function/invocations \
  -H "Content-Type: application/json" \
  -d '{
        "version": "2.0",
        "routeKey": "GET /hello",
        "rawPath": "/hello",
        "rawQueryString": "",
        "headers": { "accept": "*/*" },
        "requestContext": {
            "http": {
                "method": "GET",
                "path": "/hello",
                "protocol": "HTTP/1.1",
                "sourceIp": "127.0.0.1",
                "userAgent": "curl/7.79.1"
            }
        },
        "isBase64Encoded": false
      }'

12. Commit & Push to GitHub
  git add .
  git commit -m "Add FastAPI Lambda with Docker working example"
  git push origin main
13. Manual Push to ECR (1st Time Only Initially)
    
14. GitHub Actions CI/CD
    Add These Secrets in GitHub AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY,AWS_REGION, LAMBDA_FUNCTION_NAME and ECR_REGISTRY.

15. Workflow Trigger
- On every push to main, the GitHub Action will:
- Build Docker image
- Tag and push it to ECR
- Update the Lambda with the latest image
  
13. Testing Deployed Lambda
- Go to Lambda → Function URL
- Copy the URL and open in browser:

https://funtion url/hello

We should see:
{ "message": "Hello from FastAPI Lambda" }

# Summary
This project provides a fully automated workflow to:
 - Develop in GitHub Codespaces
 - Containerize a FastAPI app
 - Push to ECR
 - Deploy to AWS Lambda via CI/CD
 - Test without API Gateway using Function URLs



