# Implementing Multi-Step builds
# Build phase

FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# Run phase

FROM nginx

# for deploy env only, to make it work with elasticbeanstalk, it is not needed for dev env
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html



