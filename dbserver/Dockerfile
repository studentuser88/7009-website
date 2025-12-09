# Database Dockerfile
FROM alpine:3.18
# Install MariaDB
RUN apk add --no-cache mariadb mariadb-client  busybox-extras && \
    rm -rf /var/cache/apk/*

COPY mysqld.cnf /etc/mysql/my.cnf

# Create runtime directory, then set ownership and permissions
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld \
    && chmod 755 /etc/mysql/my.cnf

USER mysql
EXPOSE 3306
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 CMD mariadb-admin ping -h localhost || exit 1
CMD ["mysqld"]
