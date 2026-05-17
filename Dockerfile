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

# Create a data directory for persistent storage
RUN mkdir -p /app/data

# Expose port 8000 (default Django port)
EXPOSE 8000

# Define volume for persistent data (database, etc.)
VOLUME ["/app/data"]

# Run gunicorn as the main process
CMD [ "gunicorn", "--bind", "0.0.0.0:8000", "todo_list.wsgi" ]

#docker exec -it bd70e4cbf064 sh -c "python manage.py createsuperuser --noinput"

# docker exec -it -e DJANGO_SUPERUSER_PASSWORD=random \
#   -e DJANGO_SUPERUSER_USERNAME=admin \
#   -e DJANGO_SUPERUSER_EMAIL=admin@example.com \
#   bd70e4cbf064 python manage.py createsuperuser --noinput