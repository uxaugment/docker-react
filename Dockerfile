FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# now we have /app/build folder from build command

FROM nginx
EXPOSE 80
# dump everything else, we only want /app/build
COPY --from=builder /app/build /usr/share/nginx/html

#docker run -p 3000:80 ccb93bb3a6f5