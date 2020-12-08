# syntax=docker/dockerfile:experimental
FROM python:3.6
RUN mkdir -p /app

WORKDIR /app

# Install Go
RUN apt-get update && apt-get install build-essential
COPY scripts/server-build/install-go.sh scripts/server-build/install-go.sh
RUN ./scripts/server-build/install-go.sh

# Install Storj
COPY scripts/server-build/storj-setup.sh scripts/server-build/storj-setup.sh
RUN ./scripts/server-build/storj-setup.sh

ADD . .

CMD ["python3", "-u","main.py"]
