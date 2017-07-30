FROM jbonachera/alpine
ENTRYPOINT ["/sbin/entrypoint"]
EXPOSE 28015 29015 8080
RUN apk -U add curl rethinkdb bind-tools && \
    rm -rf /var/cache/apk/*
RUN touch /var/lib/rethinkdb/.dockerkeep && \
    chown rethinkdb -R /var/lib/rethinkdb
VOLUME ["/var/lib/rethinkdb"]
WORKDIR /var/lib/rethinkdb
COPY entrypoint /sbin/entrypoint
USER rethinkdb
