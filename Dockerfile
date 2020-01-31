FROM node:alpine

WORKDIR /app

ADD package.json package-lock.json ./

RUN npm install

ADD app.js ./

CMD ["node", "app.js"]
