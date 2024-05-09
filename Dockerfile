FROM node:8

WORKDIR /app

COPY package*.json ./

RUN npm install
#RUN mv /app/node_modules /node_modules

ADD . /app

EXPOSE 3000

#CMD [ "npm", "start" ]
CMD [ "node", "src/index.js" ]
