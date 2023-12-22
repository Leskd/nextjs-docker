FROM node:18.17.1 as base

FROM base as builder
WORKDIR /home1/irteam
COPY --chown=irteam:irteam . ./
RUN yarn -v || npm i yarn -g
RUN yarn && yarn build

RUN npm i pm2 -g
RUN pm2 install pm2-logrotate

CMD [ "pm2-runtime", "start", "pm2.json", "--env beta"]