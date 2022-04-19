#!/bin/env bash

cat gitpod.env | envsubst > .env
docker-compose up