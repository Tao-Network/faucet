FROM node:8
MAINTAINER ToMo Team

RUN npm install -g pm2

WORKDIR /build

COPY ./ /build
RUN npm install
RUN cd ./public && npm install && npm run sass && npm run coffee

EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["pm2", "start", "-x", "--no-daemon", "index.js"]
