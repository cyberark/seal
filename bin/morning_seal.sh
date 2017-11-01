#!/bin/bash

function run_seal_for {
    local org="$1"
    summon -f config/secrets.yml \
           docker run \
           --rm \
           -e "SEAL_ORGANISATION=$org" \
           --env-file @SUMMONENVFILE \
           registry.tld/cyberark/seal:latest
}

# use top-level directory
cd "$(git rev-parse --show-toplevel)"

# run seal for two orgs
run_seal_for cyberark
run_seal_for conjur
