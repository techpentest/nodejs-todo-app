# Node Base Image

FROM node:16
WORKDIR /node
COPY package*.json ./
COPY . .
EXPOSE 3000
RUN npm install
RUN npm run test
ENTRYPOINT start npm

