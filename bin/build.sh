#!/bin/bash -e

cd "$(git rev-parse --show-toplevel)"
docker build -t seal .
