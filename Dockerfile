FROM klakegg/hugo AS build
COPY ./ /src/

ARG BASE_URL
RUN HUGO_BASEURL=${BASE_URL} hugo -v -d /build

FROM nginx AS server
RUN rm -r /usr/share/nginx/html/*
COPY --from=build /build/ /usr/share/nginx/html/
