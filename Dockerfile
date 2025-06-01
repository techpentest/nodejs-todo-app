# Node Base Image
FROM node:16
WORKDIR /node
COPY package*.json ./
COPY . .
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
