FROM ruby:2.6.0-alpine

RUN apk update && \
    apk add build-base \
    gcc \
    musl-dev \
    mariadb-connector-c-dev \
    nodejs \
    tzdata \
    rm -f /var/cache/apk/*

WORKDIR /app

COPY . /app
RUN bundle install

COPY start_server.sh /usr/bin/
RUN  chmod +x /usr/bin/start_server.sh
ENTRYPOINT ["start_server.sh"]

# ENTRYPOINT ["bin/rails"]
# CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
