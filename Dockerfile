# syntax=docker/dockerfile:1

# Build stage
FROM golang:1.24-alpine AS build

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod ./
COPY go.sum* ./

# Copy the entire codebase to check dependencies
COPY . .

# Add missing dependencies
RUN go get github.com/jmoiron/sqlx \
    && go get github.com/lib/pq \
    && go get golang.org/x/text/language \
    && go get golang.org/x/text/message \
    && go get github.com/julienschmidt/httprouter \
    && go get github.com/tomasen/realip \
    && go get golang.org/x/crypto/bcrypt

# Build the application
RUN CGO_ENABLED=0 go build -o /bin/server ./cmd/...

# Final stage
FROM alpine:latest AS final

# Install runtime dependencies
RUN apk --no-cache add \
    ca-certificates \
    tzdata \
    && update-ca-certificates

# Create a non-privileged user
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

# Copy assets directory
COPY --from=build /app/assets /assets

# Copy the executable from the build stage
COPY --from=build /bin/server /bin/

# Use the non-privileged user
USER appuser

# Expose the port that the application listens on
EXPOSE 8080

# What the container should run when it is started
ENTRYPOINT ["/bin/server"]