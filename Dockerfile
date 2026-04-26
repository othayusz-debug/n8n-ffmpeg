# Estágio 1: Pega o FFmpeg estático pronto (funciona em qualquer sistema)
FROM mwader/static-ffmpeg:latest AS ffmpeg_source

# Estágio 2: A imagem do n8n
FROM n8nio/n8n:latest 

USER root

# Copia os binários do FFmpeg direto para a pasta de programas do n8n
COPY --from=ffmpeg_source /ffmpeg /usr/local/bin/
COPY --from=ffmpeg_source /ffprobe /usr/local/bin/

# Garante permissão de execução (só por segurança)
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

# Patch bug - resource:workflow sem versionId quebra addScopes
RUN sed -i "s/const isWorkflow = 'versionId' in entity || 'activeVersionId' in entity || 'triggerCount' in entity;/const isWorkflow = 'versionId' in entity || 'activeVersionId' in entity || 'triggerCount' in entity || entity.resource === 'workflow';/" /usr/local/lib/node_modules/n8n/dist/services/role.service.js

USER node
