FROM ubuntu:16.04
MAINTAINER Anastasia Zolochevska <anastasiia.zolochevska@gmail.com>

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

COPY turn_server_cert.pem /etc/ssl/turn_server_cert.pem
COPY turn_server_pkey.pem /etc/ssl/turn_server_pkey.pem

EXPOSE 3478

RUN apt-get update && apt-get install -y \
    dnsutils \
    coturn \
  && rm -rf /var/lib/apt/lists/*
  

ENTRYPOINT ["bash", "deploy-turnserver.sh"]    
