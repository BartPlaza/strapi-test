FROM strapi/base

WORKDIR /

COPY ./package.json ./

RUN npm install

COPY . .

RUN npm build

EXPOSE 1337

ENV NODE_ENV production

CMD ["npm", "start"]
