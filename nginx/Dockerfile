FROM nginx:stable-alpine
RUN apk update && \
    apk upgrade && \
    apk add python3
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid