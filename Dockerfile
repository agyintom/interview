FROM nginx:alpine

# Copy your custom config
COPY nginx.conf /etc/nginx/nginx.conf

# Or serve your own static files
COPY ./html /usr/share/nginx/html

EXPOSE 8000
