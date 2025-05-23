FROM  node:18-alpine3.17  as builder

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY ./  ./


RUN npm run  build


FROM nginx 
EXPOSE 8080
COPY --from=builder /app/build   /usr/share/nginx/html