# Phase 1 building the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# app/build will have the build

# Second Phase
FROM nginx

# /usr/share... is the default static serve location
COPY --from=builder /app/build /usr/share/nginx/html

# DONT NEED CMD because base image will start nginx