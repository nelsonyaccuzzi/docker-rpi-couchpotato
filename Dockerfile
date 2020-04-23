FROM arm32v7/alpine:edge as git

ARG CP_PATH=/var/lib/cp

RUN apk add git \
 && git clone https://github.com/CouchPotato/CouchPotatoServer.git $CP_PATH\
 && rm -rf $CP_PATH/.git

FROM arm32v7/python:2.7-alpine

ARG CP_PATH=/var/lib/cp

COPY --from=git $CP_PATH $CP_PATH

VOLUME ["/config", "/data"]

WORKDIR $CP_PATH

CMD ["python", "CouchPotato.py", "--data_dir", "/config", "--console_log"]
