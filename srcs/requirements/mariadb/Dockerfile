FROM debian:bookworm

# Install MariaDB server.
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy our MariaDB startup script into the image.
COPY tools/exec.sh /usr/local/bin/exec.sh

# Make the script executable.
RUN chmod +x /usr/local/bin/exec.sh

# Allow MariaDB to accept connections from other containers.
RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' \
    /etc/mysql/mariadb.conf.d/50-server.cnf

# Start our initialization script when the container starts.
ENTRYPOINT ["/usr/local/bin/exec.sh"]

