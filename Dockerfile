FROM nginx:latest

# Instale o envsubst (gettext-base)
RUN apt-get update && \
    apt-get install -y --no-install-recommends gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copie o template do nginx.conf
COPY nginx.conf /etc/nginx/templates/nginx.conf.template

# Substituir variáveis de ambiente e iniciar o NGINX
CMD envsubst '${USER_SERVICE_HOST} ${POST_SERVICE_HOST}' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'

# Exponha a porta 80
EXPOSE 80
