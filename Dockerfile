FROM nginx:alpine

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static content
COPY ./html /usr/share/nginx/html

# Expose port matching your containerPort
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]