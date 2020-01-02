FROM node:12.14 as build
WORKDIR /usr/src/app
COPY package*.json ./
RUN yarn
COPY ./ ./
RUN yarn run build

FROM node:12.14-alpine
WORKDIR /usr/src/app
EXPOSE 3000
ENV NODE_ENV production
COPY --from=build /usr/src/app /usr/src/app
ENTRYPOINT [ "yarn", "run" ]
CMD [ "start:prod" ]
