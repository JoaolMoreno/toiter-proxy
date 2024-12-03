FROM nginx:latest

# Copie o arquivo com placeholders
COPY nginx.conf /etc/nginx/templates/nginx.conf.template

# Script de entrypoint para substituir placeholders
RUN apt-get update && apt-get install -y envsubst
CMD envsubst < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'

EXPOSE 80
