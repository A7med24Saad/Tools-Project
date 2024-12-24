# Use the official MySQL image
FROM mysql:8.0

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=A7med2452003
ENV MYSQL_DATABASE=package_tracking

# Copy the init.sql file (or any other SQL scripts) into the container
COPY ./db-init /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306               
