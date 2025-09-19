# Use Python 3.13 base image
FROM python:3.13-slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=5000

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency list first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 5000

# Run with Gunicorn (Flask app in app.py -> variable `app`)
CMD gunicorn -b 0.0.0.0:$PORT app:app
