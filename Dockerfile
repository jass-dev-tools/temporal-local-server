# Usa una imagen base ligera
FROM ubuntu:20.04

# Instala curl y tar para descargar y extraer el archivo
#RUN apt-get update && apt-get install -y curl tar nginx
RUN apt-get update && apt-get install -y curl tar

# Define la URL desde la que se descargará el archivo .tar.gz
ENV TEMPORAL_CLI_URL=https://temporal.download/cli/archive/latest?platform=linux&arch=amd64

# Crea un directorio de trabajo
WORKDIR /usr/local/bin

# Descarga y extrae el archivo .tar.gz
RUN curl -L $TEMPORAL_CLI_URL -o temporal_cli_1.1.0_linux_amd64.tar.gz \
    && tar -xvzf temporal_cli_1.1.0_linux_amd64.tar.gz \
    && chmod +x temporal \
    && rm temporal_cli_1.1.0_linux_amd64.tar.gz

# Copia el archivo de configuración de Nginx
#COPY nginx.conf /etc/nginx/nginx.conf

    # Exponer los puertos necesarios
EXPOSE 7233 5000

# Comando por defecto para arrancar Temporal en modo desarrollo
CMD ["temporal", "server", "start-dev", "--namespace=default","--ui-port=5000", "--ip", "0.0.0.0"]
#CMD ["sh", "-c", "temporal server start-dev --namespace=default --ui-port=5000 --ip 0.0.0.0 --ui-public-path=/ui/ & nginx -g 'daemon off;'"]
#CMD ["sh", "-c", "temporal server start-dev --namespace=default --ui-port=5000 --ip 0.0.0.0 --ui-public-path=/ui/"]
