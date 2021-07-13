FROM node:12-alpine as dep
COPY package*.json package-lock.json ./
RUN npm install

FROM node:12-alpine
WORKDIR /home/node/app
COPY --from=dep /node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD npm start
