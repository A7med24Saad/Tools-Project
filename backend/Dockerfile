# Use the official Golang image
FROM golang:1.23

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download
RUN go get github.com/joho/godotenv
RUN go get -u gorm.io/gorm
RUN go get -u gorm.io/driver/sqlite
# Copy the entire project into the container
COPY . .

# Build the Go application
RUN go build -o bin main.go

# Set environment variables for the database
ENV DB_HOST=host.docker.internal:3306 \
    DB_USER=root \
    DB_PASSWORD=A7med2452003 \
    DB_NAME=package_tracking

# Expose the application's port
EXPOSE 8000

# Run the application
ENTRYPOINT ["/app/bin"]
