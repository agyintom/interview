FROM nginx:alpine

ARG VERSION=dev
ARG BUILD_DATE
ARG GIT_SHA

RUN echo "<html> \
  <head><title>My Nginx App</title></head> \
  <body> \
    <h1>My Nginx App v1.2</h1> \
    <table> \
      <tr><td><b>Version</b></td><td>${VERSION}</td></tr> \
      <tr><td><b>Built</b></td><td>${BUILD_DATE}</td></tr> \
      <tr><td><b>Commit</b></td><td>${GIT_SHA}</td></tr> \
      <tr><td><b>Status</b></td><td>All systems operational</td></tr> \
    </table> \
  </body> \
</html>" > /usr/share/nginx/html/index.html

EXPOSE 80
