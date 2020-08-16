#Multi-step build process for production (1. Build 2. Run) 

## Step 1: Build
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

## Step 2: Run
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html