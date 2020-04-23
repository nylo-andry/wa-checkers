FROM nginx

RUN mkdir /usr/share/nginx/html/dist

COPY ./packages/game/pkg/* /usr/share/nginx/html/dist/
COPY ./packages/web/dist/* /usr/share/nginx/html/dist/
COPY ./packages/web/index.html /usr/share/nginx/html/
