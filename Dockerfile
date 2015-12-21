FROM rocker/hadleyverse
MAINTAINER Paul Staab <develop (at) paulstaab.de>

# Install valgrind
RUN apt-get update \
  && apt-get install -y --no-install-recommends -t unstable \
    valgrind \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Install my packages with dependencies
RUN install2.r --error --deps TRUE \
  coala \
  jaatha \ 
  scrm

