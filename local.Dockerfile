FROM golang:1.19.3

RUN apt update && apt upgrade -y && \
	apt install -y git \
	make openssh-client

WORKDIR /migrations

COPY . .

RUN go mod download

RUN chmod +x /migrations/entrypoint.sh

CMD ["/migrations/entrypoint.sh"]