FROM 		--platform=$TARGETOS/$TARGETARCH ubuntu:22.04
ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
			&& apt install -y curl ca-certificates openssl git tar gnupg2 sqlite3 fontconfig tzdata iproute2 libfreetype6 software-properties-common \
			&& useradd -d /home/container -m container

RUN			apt install -y openjdk-17-jdk

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
