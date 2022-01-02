#THIS IS TESTING V3 20220102
FROM debian:latest

LABEL maintainer="AdamWHall" \
      name="TrackMania 2 Server" \
      version="1.0"

#set env variable
ENV DEBIAN_FRONTEND noninteractive

# Install packages to container
RUN apt update -y \
    && apt upgrade -y  \
    && apt install -y \
        wget \
        nano \
        unzip \
        sudo \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Add dedicated TM2 user
RUN useradd -m -d /srv tm2

# Add Entrypoint script
ADD start.sh /start.sh

# Create needed data dir and set the dedicated TM2 user as owner
RUN mkdir -p /srv \
    && chown -R tm2:tm2 /srv
RUN chmod +x /start.sh \
    && chown tm2:tm2 /start.sh
RUN touch /RunSrvTM.sh
RUN chmod +x /RunSrvTM.sh \
    && chown tm2:tm2 /RunSrvTM.sh

# Expose a volume so that TM2 server data is persistent
VOLUME /srv/
# TM2 port
EXPOSE 2350 3450

#switch to the dedicated TM2 user for entrypoint execution
USER tm2
ENTRYPOINT [ "/start.sh" ]