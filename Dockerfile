# Stage 1: Build
FROM python:3.8-slim-buster AS builder

# Update package list and install AWS CLI
RUN apt update -y && apt install -y awscli

# Set working directory
WORKDIR /app

# Copy application and requirements files
COPY . /app
COPY requirements.txt /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Production
FROM python:3.8-slim-buster

# Set working directory
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=builder /app /app

# Expose the application's port
#EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
