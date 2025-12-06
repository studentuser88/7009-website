#Database DockerFile
# Multi-stage build for MariaDB
FROM alpine:3.18 AS builder
RUN apk add --no-cache mariadb mariadb-client

FROM alpine:3.18
# Install only runtime dependencies
RUN apk add --no-cache mariadb mariadb-client && \
    rm -rf /var/cache/apk/*  # Clean cache to reduce size and vulnerabilities

# Create non-root user
RUN addgroup -g 1000 mysql && \
    adduser -D -u 1000 -G mysql mysql

COPY --from=builder /usr/bin/mariadb* /usr/bin/
COPY mysqld.cnf /etc/mysql/my.cnf

# Set ownership and permissions for security
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld && \
    chmod 755 /etc/mysql/my.cnf

USER mysql
EXPOSE 3306
CMD ["mysqld"]
