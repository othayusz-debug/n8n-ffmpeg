FROM n8nio/n8n:latest

USER root

# Atualiza a lista e instala o FFmpeg (versão para Debian)
RUN apt-get update && apt-get install -y ffmpeg

USER node
