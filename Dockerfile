# Use the official Python image as a base image
FROM python:3.11-slim

# Set environment variables to avoid Python buffering logs and set up UTF-8 encoding
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8

# Create and set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose port 8000 (the default port for Django development server)
EXPOSE 8000

# Run migrations (adjust this step as per your project needs)
RUN python manage.py migrate

# Collect static files
RUN python manage.py collectstatic --noinput

# Command to run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
