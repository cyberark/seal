#!/bin/bash

cd "$(git rev-parse --show-toplevel)"

docker build -t seal .

summon --provider conjur \
       -f config/secrets.yml \
       docker run --rm --env-file @SUMMONENVFILE seal
