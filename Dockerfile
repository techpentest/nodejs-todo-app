# Node Base Image
<<<<<<< HEAD

FROM node:16

WORKDIR /node

COPY package*.json ./

COPY . .

=======
FROM node:16
WORKDIR /node
COPY package*.json ./
COPY . .
>>>>>>> ade091961c0fc63657ebb5548a6bf8ed4e912663
RUN npm install
RUN npm run test

EXPOSE 8000
<<<<<<< HEAD

CMD ["npm","start"]
=======
CMD ["node","app.js"]
>>>>>>> ade091961c0fc63657ebb5548a6bf8ed4e912663
