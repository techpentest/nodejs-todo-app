# Node Base Image

FROM node:16
WORKDIR /node
COPY package*.json ./
COPY . .
EXPOSE 3000
RUN npm install
ENTRYPOINT start npm

