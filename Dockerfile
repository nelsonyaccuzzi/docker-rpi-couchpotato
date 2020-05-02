ARG CP_PATH=/var/lib/cp

FROM arm32v7/alpine:edge as git

ARG VERSION
ARG CP_PATH

RUN apk add git \
 && git clone https://github.com/CouchPotato/CouchPotatoServer.git $CP_PATH \
 && git -C $CP_PATH checkout tags/build/$VERSION \
 && rm -rf $CP_PATH/.git

FROM arm32v7/python:2.7-alpine

ARG CP_PATH

COPY --from=git $CP_PATH $CP_PATH

WORKDIR $CP_PATH

CMD ["python", "CouchPotato.py", "--data_dir", "/config", "--console_log"]
