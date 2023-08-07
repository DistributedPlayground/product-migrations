#!/bin/sh

# run db migrations
echo "----- Building migrations..."
go build -o migrations/goose-migrate cmd/main.go
echo "----- Running migrations..."
./migrations/goose-migrate reset
./migrations/goose-migrate up
echo "----- ...Migrations done"
