FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN yarn

COPY . .

RUN npm run build

# Nginx

FROM nginx

# AWS nginx elastic port
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
