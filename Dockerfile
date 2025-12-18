FROM ubuntu:16.04

# Replace all apt sources with archived ones
RUN sed -i 's|archive.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list && \
    sed -i 's|security.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list

RUN apt-get clean && apt-get update && apt-get install -y \
    wget=1.17.1-1ubuntu1 \
    curl=7.47.0-1ubuntu2 \
    openssl=1.0.2g-1ubuntu4 \
    apache2=2.4.18-2ubuntu3 \
    && rm -rf /var/lib/apt/lists/*

CMD ["apache2ctl", "-D", "FOREGROUND"]
