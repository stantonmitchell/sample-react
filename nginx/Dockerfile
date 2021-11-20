FROM nginx:1.21.3
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install python3 -y
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
