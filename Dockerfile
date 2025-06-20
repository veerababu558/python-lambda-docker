FROM public.ecr.aws/lambda/python:3.11

# Copy source code
COPY app ${LAMBDA_TASK_ROOT}

# Install dependencies
RUN pip install fastapi mangum uvicorn

# Lambda handler entry point: file.main -> handler object
CMD ["main.handler"]
