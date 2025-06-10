#!/bin/bash
echo "Starting Nginx..."
nginx -t || { echo "Nginx config test failed"; exit 1; }
nginx -g "daemon off;" &
echo "Starting Gunicorn..."
gunicorn --bind 0.0.0.0:5000 app:app