# BUILD PHASE : install dependencies and build the application
# this is a temporary container
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . . 
RUN npm run build
# the output of this goes to the working directory 
# i.e. it will be in /app/build

# RUN PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html