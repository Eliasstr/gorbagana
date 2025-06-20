#!/bin/bash

mkdir bootstrap-validator
solana-keygen new --no-passphrase -o bootstrap-validator/identity.json
solana-keygen new --no-passphrase -o bootstrap-validator/vote.json
solana-keygen new --no-passphrase -o bootstrap-validator/withdrawer.json
solana-keygen new --no-passphrase -o bootstrap-validator/stake.json

echo "creating genesis block"

solana-genesis \
    --ledger bootstrap-validator/ledger \
    --faucet-pubkey faucet.json \
    --faucet-lamports 500000000000000000 \
    --hashes-per-tick auto \
    --slots-per-epoch 500 \
    --bootstrap-validator-stake-lamports 500000000000000 \
    --cluster-type development
