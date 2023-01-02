FROM caddy:2.6.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/RussellLuo/caddy-ext/ratelimit

FROM caddy:2.6.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
