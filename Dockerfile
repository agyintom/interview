# syntax=docker/dockerfile:1
FROM nginx:1.27-alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY app/nginx.conf /etc/nginx/conf.d/app.conf
COPY app/index.html /usr/share/nginx/html/index.html

# nginx official alpine image already has an 'nginx' user (uid 101)
# make the required dirs writable for that user
RUN chown -R nginx:nginx \
      /var/cache/nginx \
      /var/log/nginx \
      /etc/nginx/conf.d \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

USER nginx

EXPOSE 8080

HEALTHCHECK --interval=15s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost:8080/healthz || exit 1
