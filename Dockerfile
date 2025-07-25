FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && \
    apt -y upgrade && \
    apt install -y squid && \
    apt clean && rm -rf /var/lib/apt/lists/*
COPY squid.conf /etc/squid/squid.conf
COPY domaine_bloque.txt /etc/squid/domaine_bloque.txt
EXPOSE 3128
CMD [ "squid","-N","-d","1" ]