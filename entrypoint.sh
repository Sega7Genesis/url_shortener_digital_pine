#!/bin/bash

# Apply database migrations
echo "Apply database migrations"
python manage.py makemigrations short_urls --no-input
python manage.py migrate short_urls --no-input


# Start server
echo "Starting server"
gunicorn \
  --bind 0.0.0.0:8080 \
  url_shortener.wsgi:application
