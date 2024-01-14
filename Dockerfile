# Use an official MySQL image as the base image
FROM mysql:8.0

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=admin
ENV MYSQL_DATABASE=assurance_db
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=admin

# Copy the SQL file into the Docker image
COPY database.sql /docker-entrypoint-initdb.d/

# Expose the MySQL port
EXPOSE 3306
