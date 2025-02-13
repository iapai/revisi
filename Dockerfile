FROM nginx:stable-alpine 

RUN rm -rf /usr/share/nginx/html/* 

COPY . . /usr/share/nginx/html 

CMD ["nginx", "-g", "daemon off;"] 