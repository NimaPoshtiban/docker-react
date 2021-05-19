FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN yarn

COPY . .

RUN npm run build

# Nginx

FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html
