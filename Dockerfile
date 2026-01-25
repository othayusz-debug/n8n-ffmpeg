FROM alpine:3.19

# Instalar dependências
RUN apk update && apk add --no-cache \
  nodejs \
  npm \
  ffmpeg \
  tini \
  bash

# Instalar n8n
RUN npm install -g n8n

# Criar usuário node
RUN addgroup -g 1000 node && \
    adduser -D -u 1000 -G node node

USER node
WORKDIR /home/node

EXPOSE 5678

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["n8n"]
