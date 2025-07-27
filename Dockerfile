FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && \
    apt -y upgrade && \
    apt install -y squid && \
    apt install -y squid-langpack && \
    apt install -y apache2-utils && \
    apt clean && rm -rf /var/lib/apt/lists/*
COPY squid.conf /etc/squid/squid.conf
COPY domaine_bloque.txt /etc/squid/domaine_bloque.txt
COPY ERR_ACCESS_DENIED.html /usr/share/squid/errors/English/ERR_ACCESS_DENIED
COPY domain_whitelist.txt /etc/squid/domain_whitelist.txt
COPY intialisation.sh /intialisation.sh
RUN chmod +x /intialisation.sh
EXPOSE 3128
RUN htpasswd -cb /etc/squid/passwd utilisateur2 motdepasse2
RUN htpasswd -cb /etc/squid/passwd oussama oussama
ENTRYPOINT ["/intialisation.sh"]