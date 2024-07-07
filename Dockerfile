# Use an official Python runtime as the base image
FROM python:3.7-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire directory into the container, excluding the .git directory
COPY . .
RUN find /app -type d -name ".git" -exec rm -rf {} +

EXPOSE 5000

# Set the command to run the application
CMD ["python", "app.py"]