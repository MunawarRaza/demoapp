FROM node:18.20-alpine3.18 AS Build

WORKDIR /home/node/app

COPY . .

RUN npm install && npm run build

FROM nginx:latest

COPY --from=0 /home/node/app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
