FROM ubuntu:latest
WORKDIR /app
ENV PATH="$PATH:/usr/games"
COPY wisecow.sh .
RUN chmod +x wisecow.sh
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y \
    bash \
    cowsay \
    fortune-mod \
    netcat-openbsd
RUN rm -rvf /var/lib/apt/lists/*
EXPOSE 4499
CMD ["./wisecow.sh"]
