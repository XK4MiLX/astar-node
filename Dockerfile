FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \ 
apt-get install wget curl -y

RUN BIN_NAME=$(curl -s https://api.github.com/repos/AstarNetwork/Astar/releases/latest | grep "tag_name" | awk '{print "https://github.com/AstarNetwork/Astar/releases/download/" substr($2, 2, length($2)-3) "/astar-collator-v" substr($2, 3, length($2)-4) "-ubuntu-x86_64.tar.gz"}') && \
echo -e "Downloading file: $BIN_NAME" && \
wget ${BIN_NAME} && \
tar -xvf astar-collator*.tar.gz && \
mv ./astar-collator /usr/local/bin && \
chmod +x /usr/local/bin/astar-collator && \
rm -rf astar-collator*.tar.gz

COPY run.sh /run.sh
RUN chmod 755 /run.sh  

EXPOSE 30333
EXPOSE 9933
EXPOSE 9944

VOLUME /root

ENTRYPOINT ["/bin/sh", "-c" , "/run.sh"]
