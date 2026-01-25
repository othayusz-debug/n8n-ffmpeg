FROM n8nio/n8n:latest

USER root
# Instala o FFmpeg
RUN apk add --no-cache ffmpeg

USER node
