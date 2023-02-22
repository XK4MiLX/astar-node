FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \ 
apt-get install wget curl -y

COPY run.sh /run.sh
RUN chmod 755 /run.sh  

EXPOSE 30333
EXPOSE 9933
EXPOSE 9944

VOLUME /root

ENTRYPOINT ["/bin/sh", "-c" , "/run.sh"]
