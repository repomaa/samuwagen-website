FROM klakegg/hugo AS build
COPY config.yaml /src/
COPY content /src/content
COPY layouts /src/layouts
COPY themes /src/themes

RUN hugo -d /build

FROM nginx AS server
RUN rm -r /usr/share/nginx/html/*
COPY --from=build /build/ /usr/share/nginx/html/
