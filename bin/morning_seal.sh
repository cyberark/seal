#!/bin/bash

cd "$(git rev-parse --show-toplevel)"
summon --provider conjur \
       -f config/secrets.yml \
       docker run \
       --rm \
       -e 'SEAL_ORGANISATION=cyberark' \
       --env-file @SUMMONENVFILE \
       seal
