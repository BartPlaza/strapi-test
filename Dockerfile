FROM strapi/base

WORKDIR /

RUN sudo apt-get -y update

RUN apt-get install -y sqlite3 libsqlite3-dev

RUN mkdir /db

RUN /usr/bin/sqlite3 /.tmp/data.db

COPY ./package.json ./

RUN npm install

COPY . .

ENV NODE_ENV production

RUN npm run-script build

EXPOSE 1337

CMD ["npm", "start"]
