FROM alpine as build

RUN apk update \
    && apk add py3-pip \
    && pip3 install mkdocs mkdocs-material pymdown-extensions mkdocs-git-revision-date-localized-plugin 

# USER 1001
WORKDIR /site
COPY mkdocs.yml .
COPY docs docs

RUN mkdocs build --verbose

FROM nginx
# COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /site/site /usr/share/nginx/html

# ENTRYPOINT ["mkdocs", "serve", "-a", "*:8000","--no-livereload"]