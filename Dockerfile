# base image
FROM node:16-alpine as builder
WORKDIR '/app'
# copy file to container that are needed for installation
COPY package.json .
#install dependencies
RUN npm install
# copy files that change often to container
COPY . .
# default commands
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
