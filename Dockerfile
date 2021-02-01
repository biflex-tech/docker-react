#mark stage as builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# /app/build - do przeniesienia na prod

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

