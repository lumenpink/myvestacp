FROM debian:buster-20210408
LABEL maintainer="Lohn <j@lo.hn>"
ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm
RUN apt-get update \
    && apt-get -yf --no-install-recommends install \
    gnupg \
    software-properties-common \
    sudo \
    wget \
    curl \
    dpkg-dev \
    && rm -rf /tmp/* \
    && apt-get -yf autoremove \
    && apt-get clean 
RUN curl -O http://c.myvestacp.com/vst-install-debian.sh \
    && bash vst-install-debian.sh \
    -l pt_BR -y no \
    -e demo@vestacp.com -p p4ssw0rd \
    -o yes -q yes --postgresql yes 
VOLUME ["/vesta", "/home", "/backup"]
EXPOSE 22 25 53 54 80 110 143 443 465 587 993 995 1194 3000 3306 5432 5984 6379 8083 10022 11211 27017