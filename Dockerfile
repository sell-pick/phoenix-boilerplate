FROM test-base as build

# Add application files
ADD lib lib
ADD config config

RUN mix compile
RUN mix release

# Build release image
FROM alpine:3.9 AS app

RUN apk add --update bash openssl

RUN mkdir /app
WORKDIR /app

COPY --from=build /app/_build/prod/rel/test ./
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app
ENV MIX_ENV=prod
EXPOSE 8080

CMD ["bin/test", "start"]
