FROM ubuntu:22.04

RUN apt-get -y update 
RUN apt-get -y upgrade 
RUN apt install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/setup_21.x 
RUN apt-get install -y nodejs
RUN apt-get -y install npm
RUN node -v
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN n latest

RUN apt-get update && \
    apt-get install -y wget iputils-ping curl && \
    wget -O /tmp/nordrepo.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb && \
    apt-get install -y /tmp/nordrepo.deb && \
    apt-get update && \
    apt-get install -y nordvpn=3.17.1 && \
    apt-get remove -y wget nordvpn-release && \
    rm /tmp/nordrepo.deb && \
    apt-get clean

RUN apt-get install -y ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils


# WORKDIR /app
# COPY . .

# ENTRYPOINT /etc/init.d/nordvpn start && sleep 5 && node node_with_nord.js
