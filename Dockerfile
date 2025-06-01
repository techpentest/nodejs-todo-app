# Node Base Image

FROM node:16

WORKDIR /node

COPY package*.json ./

COPY . .

EXPOSE 8000

CMD ["npm","start"]

