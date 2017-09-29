#!/bin/bash

cd "$(git rev-parse --show-toplevel)"
summon --provider conjur \
       -f config/secrets.yml \
       docker run \
       --rm \
       -e 'SEAL_ORGANISATION=cyberark' \
       -e 'SLACK_CHANNEL="#robot-test"' \
       --env-file @SUMMONENVFILE \
       registry.tld/cyberark/seal:latest
