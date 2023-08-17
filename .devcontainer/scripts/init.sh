#!/bin/bash

set -e

if [ ! -d "bitcoin" ]; then
    git clone https://github.com/bitcoin/bitcoin
    cd bitcoin
    git remote rename origin upstream

    mkdir -p /workspace/bitcoin/.git/hooks/
    cp /scripts/pre-push-hook.sh /workspace/bitcoin/.git/hooks/pre-push

    ./autogen.sh
    ./configure CXXFLAGS="-O0 -g" CFLAGS="-O0 -g"
else
    echo "bitcoin repository already initialized"
fi
