FROM node:16-alpine as builder

WORKDIR '/app'

COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# files copied into nginx/html directory will be automatically served up
COPY --from=builder app/build ./usr/share/nginx/html