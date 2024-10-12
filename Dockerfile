FROM python:3.8-slim-buster

# Set the working directory
WORKDIR /app

# Copy the contents of the local directory to the container
COPY . /app

# Install necessary system packages
RUN apt-get update -y && \
    apt-get install -y awscli ffmpeg libsm6 libxext6 unzip && \
    apt-get clean

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Specify the command to run the application
CMD ["python3", "app.py"]
