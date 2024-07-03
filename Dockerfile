# Use a slim python image as the base
FROM python:3.11-slim

# Set a working directory for the application
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt .

# Install dependencies using pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose port 8000 (default Django port)
EXPOSE 8000

# Run gunicorn as the main process
CMD [ "gunicorn", "--bind", "0.0.0.0:8000", "todo_list.wsgi" ]