FROM node:lts-alpine 

WORKDIR /app 

COPY package*.json ./ 
RUN npm ci 

COPY . ./
RUN npm run install 

FROM nginx:stable-alpine 
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80 
CMD [ "nginx", "g", "daemon off;" ]
