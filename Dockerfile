FROM ubuntu:16.04

# Point to old Ubuntu repositories (since 16.04 is EOL)
RUN sed -i 's|archive.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list && \
    sed -i 's|security.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list

# Install old vulnerable packages without version pins
RUN apt-get clean && apt-get update && apt-get install -y \
    wget \
    curl \
    openssl \
    apache2 \
    && rm -rf /var/lib/apt/lists/*

CMD ["apache2ctl", "-D", "FOREGROUND"]
