FROM n8nio/n8n:alpine

USER root

RUN apk update && apk add --no-cache ffmpeg

USER node
