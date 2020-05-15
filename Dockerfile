FROM node:12.16.3

RUN mkdir -p /src/app

WORKDIR /src/app

COPY . /src/app

RUN npm install

EXPOSE 3000

CMD [ "npm", "run", "start" ]