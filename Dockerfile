FROM nginx:alpine

# Default PORT environment variable if not provided by host (e.g. Render/Cloud Run)
ENV PORT=80

# Remove default nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

# Copy web files
COPY index.html rooney.png /usr/share/nginx/html/

# Copy nginx config template (nginx docker image runs envsubst on files in /etc/nginx/templates/)
COPY default.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
