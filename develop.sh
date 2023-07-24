#!/bin/bash


echo -e "------\n\nSleeping for 10 seconds to allow DB to start\n\n------"
sleep 10

echo -e "------\n\nDisabling Telemetry\n\n------"
medusa telemetry --disable

echo -e "------\n\nRunning DB Migrations\n\n------"
medusa migrations run

echo -e "------\n\nStarting Medusa\n\n------"
medusa $1