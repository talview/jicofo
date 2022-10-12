    ARG JITSI_REPO=jitsi
    ARG BASE_TAG=latest
    FROM ${JITSI_REPO}/base-java:${BASE_TAG}


    RUN apt-dpkg-wrap apt-get update && \
        apt-dpkg-wrap apt-get install -y jicofo unzip && \
        apt-cleanup

    COPY rootfs/ /
    WORKDIR /jicofo

    ADD . /jicofo

    RUN cd /jicofo

    RUN unzip target/jicofo-1.1-SNAPSHOT-archive.zip -d target/
    RUN mv /usr/share/jicofo/ /tmp
    RUN mkdir /usr/share/jicofo/
    RUN cp -ru target/jicofo-1.1-SNAPSHOT/* /usr/share/jicofo/

    VOLUME /config
