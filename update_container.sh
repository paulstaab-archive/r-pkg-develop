#!/bin/bash

docker stop r-pkg-develop
docker rm r-pkg-develop
docker pull paulstaab/r-pkg-develop

