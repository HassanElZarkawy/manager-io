FROM mono:latest

LABEL org.opencontainers.image.authors="Hassan El-Zarkawy <hassan.elzarkawy@gmail.com>"
LABEL org.opencontainers.image.title="Manager.io Server"
LABEL org.opencontainers.image.description="Manager.io accounting software server instance"
LABEL org.opencontainers.image.url="https://www.manager.io/"
LABEL org.opencontainers.image.source="https://github.com/Manager-io/Manager.zip"
LABEL org.opencontainers.image.version="latest"
LABEL org.opencontainers.image.created="2025-05-17"
LABEL org.opencontainers.image.licenses="Proprietary"
LABEL org.opencontainers.image.vendor="Hassan El-Zarkawy"

RUN mkdir /manager /data
WORKDIR /manager

RUN apt-get update \
 && apt-get install -y wget unzip \
 && rm -rf /var/lib/apt/lists/* \
 && wget https://github.com/Manager-io/Manager.zip/releases/download/$(curl --silent "https://api.github.com/repos/Manager-io/Manager.zip/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')/Manager.zip -O /manager/Manager.zip \
 && unzip Manager.zip \
 && rm Manager.zip
CMD mono ManagerServer.exe -port 8080 -path "/data"

VOLUME ["/data"]
EXPOSE 8080