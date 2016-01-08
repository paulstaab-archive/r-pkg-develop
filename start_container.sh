#!/bin/bash

docker run -d -P -p 8787:8787 \
  -v /home/$USER/.config/rocker:/home/$USER \
  -v /home/$USER/Workspace:/home/$USER/Workspace \
  -e USER=$USER -e USERID=$UID \
  --name="r-pkg-develop" \
  --restart="always" \
  paulstaab/r-pkg-develop
