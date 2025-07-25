FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && \
    apt -y upgrade && \
    apt install -y squid
COPY squid.conf /etc/squid/squid.conf
EXPOSE 3128
CMD [ "squid","-N","-d","1" ]