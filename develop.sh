#!/bin/bash


echo -e "------\n\nSleeping for 10 seconds to allow DB to start\n\n------"
sleep 10

echo -e "------\n\nDisabling Telemetry\n\n------"
pnpm medusa telemetry --disable

echo -e "------\n\nRunning DB Migrations\n\n------"
pnpm medusa migrations run

echo -e "------\n\nSeeding DB\n\n------"
pnpm medusa seed -f ./data/seed.json

echo -e "------\nCreating Default TKWS Administrator User\n------"
pnpm medusa user -e <insert email> -p <insert password>

echo -e "------\n\nStarting Medusa\n\n------"
pnpm medusa $1