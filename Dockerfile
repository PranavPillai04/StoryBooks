#Base image from node, slim to reduce size
FROM node:14-slim

WORKDIR /usr/src/app

# Get just package.json and package-locl.json first, helps docker's caching process
COPY ./package*.json ./

RUN npm install

# Copy in rest of source code
COPY . .

# Modify user to be non-root node user
USER node

EXPOSE 3000

# Start app in production mode
CMD ["npm", "start"]

# docker build -t storybooks-app .

# Then, use docker compose instead of docker run, because mongoDB is running in a separate container