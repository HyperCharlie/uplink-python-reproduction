#!/bin/bash
# Make sure go is working
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
go version

# Install the python package
pip install uplink-python==1.0.7

# Clone the uplink repo
mkdir "$HOME/uplink"
pushd "$HOME/uplink" || exit
git clone https://github.com/storj/uplink-c 
pushd uplink-c || exit
git checkout v1.1.0

# Build it
go build -o libuplinkc.so -buildmode=c-shared

# Move it
mv libuplinkc.so /usr/local/lib/python3.6/site-packages/uplink_python

# Clean Up
popd || exit
rm -rf uplink-c

