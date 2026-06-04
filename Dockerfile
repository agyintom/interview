FROM nginx:alpine
RUN echo "<h1>Hello Again! Built and released on $(date)</h1>" > /usr/share/nginx/html/index.html
EXPOSE 80
