#mark stage as builder
FROM node:alpine
WORKDIR '/app'
COPY *.json ./
RUN npm install
COPY . .
RUN npm run build 

# /app/build - do przeniesienia na prod

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#CMD ["nginx", "-g", "daemon off;"]

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
