FROM node:14.17.3-alpine as build-deps

RUN apk add --no-cache git libc6-compat
WORKDIR /app

RUN git clone --branch main https://github.com/dappnode/node-dashboard-app.git .

RUN sed -i 's/BLOCKNATIVE_DAPP_ID,/NEXT_PUBLIC_BLOCKNATIVE_DAPP_ID,/' src/configuration.ts

RUN yarn install
RUN NEXT_PUBLIC_BLOCKNATIVE_DAPP_ID=NEXT_PUBLIC_BLOCKNATIVE_DAPP_ID_REPLACE NEXT_PUBLIC_ENV=production NEXT_PUBLIC_NODE_URL=NEXT_PUBLIC_NODE_URL_REPLACE NEXT_PUBLIC_XDAI_NODE_URL=NEXT_PUBLIC_XDAI_NODE_URL_REPLACE yarn build
RUN yarn export

FROM nginx:stable

COPY --from=build-deps /app/out /usr/share/nginx/html

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
