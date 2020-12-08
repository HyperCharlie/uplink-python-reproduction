#!/bin/bash

#Download the Go package
GOFILE=go1.13.8.linux-amd64.tar.gz
curl -O https://storage.googleapis.com/golang/$GOFILE

# Extract the tarball
tar -xvf $GOFILE

# Move it
mv go /usr/local

# Set the path
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Test it
go version
