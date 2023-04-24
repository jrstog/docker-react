#Build Phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#/app/build <---- folder with all the stuff we want from build

#Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html