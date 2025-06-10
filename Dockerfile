FROM docker.io/library/python:3.9-slim

# Install Nginx and dependencies
RUN apt-get update && apt-get install -y nginx \
    && pip install --no-cache-dir flask==2.3.3 gunicorn==22.0.0 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/nginx/html/* \
    && rm -f /etc/nginx/sites-enabled/default \
    && mkdir -p /data \
    && chmod 700 /data

# Copy application files
WORKDIR /app
COPY app.py .
COPY public ./public/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start.sh .

# Set permissions
RUN chmod +x start.sh

# Ensure Nginx config is clean
RUN printf "events {}\nhttp { include /etc/nginx/conf.d/*.conf; }" > /etc/nginx/nginx.conf

EXPOSE 80
CMD ["./start.sh"]