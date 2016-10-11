#!/bin/sh

set -e

echo Building our Go Application
go build -o $GOBINARIES/godev-exmaple

echo Running our Go Application
$GOBINARIES/godev-exmaple
