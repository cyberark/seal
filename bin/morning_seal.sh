#!/bin/bash

cd "$(git rev-parse --show-toplevel)"
summon -f config/secrets.yml \
       docker run \
       --rm \
       -e 'SEAL_ORGANISATION=cyberark' \
       --env-file @SUMMONENVFILE \
       registry.tld/cyberark/seal:latest
