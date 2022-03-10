FROM node:16.14-slim AS build
WORKDIR /usr/src/app
COPY package* ./
RUN yarn
COPY . .
RUN yarn run build

FROM node:16.14-alpine
WORKDIR /usr/src/app
COPY package* ./
RUN yarn --prod
COPY --from=build /usr/src/app/ ./
EXPOSE 3000
ENV NODE_ENV production
ENTRYPOINT [ "yarn", "run" ]
CMD [ "start:prod" ]
