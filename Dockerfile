# Use an official MySQL image as the base image
FROM mysql:8.0

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}
ENV MYSQL_DATABASE=${DB_NAME}
ENV MYSQL_USER=${DB_USER}
ENV MYSQL_PASSWORD=${DB_PASSWORD}

# Copy the SQL file into the Docker image
COPY database.sql /docker-entrypoint-initdb.d/

# Expose the MySQL port
EXPOSE 3306
