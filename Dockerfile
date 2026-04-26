# Estágio 1: Pega o FFmpeg estático pronto (funciona em qualquer sistema)
FROM mwader/static-ffmpeg:latest AS ffmpeg_source

# Estágio 2: A imagem do n8n
FROM n8nio/n8n:2.16.2

USER root

# Copia os binários do FFmpeg direto para a pasta de programas do n8n
COPY --from=ffmpeg_source /ffmpeg /usr/local/bin/
COPY --from=ffmpeg_source /ffprobe /usr/local/bin/

# Garante permissão de execução (só por segurança)
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

USER node
