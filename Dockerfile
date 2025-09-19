# Use Python 3.13 base image
FROM python:3.13-slim

# Set environment vars (no .pyc, UTF-8)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency list first for caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy the rest of the app
COPY . .

# Expose port (Render expects $PORT env)
EXPOSE 5000

# Command to run the app with Gunicorn
# -b 0.0.0.0:$PORT lets Render bind dynamically
# app:app → points to Flask object inside app.py
CMD ["gunicorn", "-b", "0.0.0.0:${PORT}", "app:app"]
📄 requirements.txt
Make sure your requirements.txt has at least:

nginx
Copy code
Flask
scikit-learn
pandas
numpy
gunicorn
⚙️ Render Deployment Steps
Push your project (with Dockerfile) to GitHub/GitLab.

In Render:

Create a new Web Service.

Choose Docker as deployment method.

Point to your repo.

Render automatically builds with Dockerfile.

The CMD in Dockerfile runs Gunicorn:

nginx
Copy code
gunicorn -b 0.0.0.0:$PORT app:app
