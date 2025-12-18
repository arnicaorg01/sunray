# Vulnerable base image with known CVEs
FROM ubuntu:16.04  

# Install outdated packages with vulnerabilities
RUN apt-get update && apt-get install -y \
    wget=1.17.1-1ubuntu1 \
    curl=7.47.0-1ubuntu2 \
    openssl=1.0.2g-1ubuntu4 \
    apache2=2.4.18-2ubuntu3 \
    && rm -rf /var/lib/apt/lists/*

# Add an insecure executable
RUN chmod +x /usr/local/bin/vulnerable.sh

# Set default command (insecure script execution)
CMD ["/usr/local/bin/vulnerable.sh"]
