FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build - has all the files from buld phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
