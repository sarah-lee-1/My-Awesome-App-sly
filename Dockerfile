FROM node:10 
# FROM node:lts-alpine
WORKDIR /usr/src/app 

COPY package*.json ./ 

RUN npm install 

COPY . .

ENV APP_PORT 8080

EXPOSE 8080
CMD [ "node", "App.js" ]
