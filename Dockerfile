FROM nginx:stable-alpine

# Copy the static files to be served
COPY html/ /usr/share/nginx/html
