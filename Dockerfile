FROM node:alpine as build-stage 

WORKDIR /app

COPY . .

FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=build-stage /app /usr/share/nginx/html

EXPOSE 8080 443

CMD ["nginx", "-g", "daemon off;"]