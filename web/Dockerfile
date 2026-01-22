FROM nginx:latest
COPY . /usr/share/nginx/html/
RUN mv "/usr/share/nginx/html/Lettie Standalone Design.html" /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]