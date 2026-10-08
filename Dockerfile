# Use the official Python 3.8 Alpine image as the base image
FROM python:3.8-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the necessary packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application's port
#EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
